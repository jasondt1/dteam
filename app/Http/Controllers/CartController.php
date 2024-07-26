<?php

namespace App\Http\Controllers;

use App\Models\GameCart;
use App\Models\GameGift;
use App\Models\GameLibrary;
use App\Models\GameTransactionDetail;
use App\Models\GameTransactionHeader;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    public function add(Request $request){
        $newCart = new GameCart();

        $cart = GameCart::where('game_id', $request->game_id)->where('user_id', auth()->user()->id)->first();
        if ($cart) {
            return response()->back();
        }

        $newCart->game_id = $request->game_id;
        $newCart->user_id = auth()->user()->id;
        if(Auth::user()->game_libraries->contains('id', $request->game_id)){
            $newCart->is_gift = true;
        }
        else{
            $newCart->is_gift = false;
        }

        $newCart->save();
        return response()->json(['cart_count' => auth()->user()->game_carts->count()]);
    }

    public function updateGift($gameId, $isGift){
        $cart = GameCart::where('game_id', $gameId)->where('user_id', auth()->user()->id)->first();
        if (!$cart) {
            return redirect()->back();
        }
        $cart->is_gift = $isGift;
        $cart->save();
        return redirect()->back();
    }

    public function remove(Request $request){
        $cart = GameCart::where('game_id', $request->game_id)->where('user_id', auth()->user()->id)->first();

        if (!$cart) {
            return redirect()->back();
        }

        $cart->delete();
        return response()->json(['cart_count' => auth()->user()->game_carts->count()]);
    }

    public function removeAll(){
        GameCart::where('user_id', auth()->user()->id)->delete();
        return redirect()->back();
    }

    public function checkout(Request $request){
        $user = User::find(Auth::user()->id);
        $carts = Auth::user()->game_carts;

        $totalPrice = 0;
        foreach ($carts as $game) {
            $gamePrice = $game->price;
            $discountedPrice = $gamePrice - ($gamePrice * ($game->discount / 100));
            $totalPrice += $discountedPrice;
            if($game->pivot->is_gift){
                if($request->gift_recipient_id[$game->id] == null){
                    return redirect()->back()->with('error', 'Please select a recipient for the gift.');
                }
                else{
                    $game->recipient_id = $request->gift_recipient_id[$game->id];
                    $game->gift_message = $request->gift_message[$game->id];
                }
            }
        }

        if ($user->wallet < $totalPrice) {
            return redirect()->back()->with('error', 'Insufficient balance in wallet.');
        }

        $user->wallet -= $totalPrice;
        $user->point += $totalPrice * 0.01;
        $user->save();

        foreach ($carts as $game) {
            if($game->pivot->is_gift){
                $gift = new GameGift();
                $gift->sender_id = Auth::user()->id;
                $gift->receiver_id = $game->recipient_id;
                $gift->game_id = $game->id;
                $gift->message = $game->gift_message;
                $gift->status = 0;
                $gift->discount_percentage = $game->discount_percentage;
                $gift->save();
            }
            else{
                if($user->game_libraries->contains('id', $game->id)){
                    return redirect()->back();
                }
                $library = new GameLibrary();
                $library->user_id = $user->id;
                $library->game_id = $game->id;
                $library->discount_percentage = $game->discount_percentage;
                $library->save();
            }
        }

        GameCart::where('user_id', $user->id)->delete();

        return redirect()->route('purchase-history');
    }

    public function showCheckout(){
        $user = User::find(Auth::user()->id);
        $friendswith = $user->friends_with ?? collect();
        $friendsof = $user->friends_of ?? collect();
        $friends = $friendswith->concat($friendsof);
        $friends = $friends->sortBy(function($friend) {
            return $friend->nickname;
        });

        return view('user/checkout', compact('friends'));
    }

}
