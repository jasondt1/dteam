<?php

namespace App\Http\Controllers;

use App\Models\GameWishlist;
use Illuminate\Http\Request;

class WishlistController extends Controller
{
    public function add(Request $request){
        $newWishlist = new GameWishlist();

        $wishlist = GameWishlist::where('game_id', $request->game_id)->where('user_id', auth()->user()->id)->first();
        if ($wishlist) {
            return response()->back();
        }

        $newWishlist->game_id = $request->game_id;
        $newWishlist->user_id = auth()->user()->id;

        $newWishlist->save();
        return response()->json(['wishlist_count' => auth()->user()->game_wishlists->count()]);
    }

    public function remove(Request $request){
        $wishlist = GameWishlist::where('game_id', $request->game_id)->where('user_id', auth()->user()->id)->first();


        if (!$wishlist) {
            return redirect()->back();
        }

        $wishlist->delete();
        return response()->json(['wishlist_count' => auth()->user()->game_wishlists->count()]);
    }
}
