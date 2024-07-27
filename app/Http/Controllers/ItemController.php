<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\ItemLibrary;
use App\Models\User;
use Illuminate\Http\Request;

class ItemController extends Controller
{
    public function viewShop(){
        $backgrounds = Item::where('type', 'background')->get();
        $avatars = Item::where('type', 'avatar')->get();
        return view('user/point-shop', compact('backgrounds', 'avatars'));
    }

    public function purchaseItem(Request $request){
        $item = Item::find($request->id);
        $user = User::find(auth()->user()->id);

        if($user->item_libraries->contains('id', $item->id)){
            return redirect()->back()->with('error', 'You already have this item.');
        }

        if($user->point < $item->price){
            return redirect()->back()->with('error', 'Insufficient point.');
        }

        $user->point -= $item->price;
        $user->save();

        $itemLibrary = new ItemLibrary();
        $itemLibrary->item_id = $item->id;
        $itemLibrary->user_id = $user->id;
        $itemLibrary->save();

        if($item->type == 'background'){
            return redirect()->route('edit-profile-background');
        } else {
            return redirect()->route('edit-profile-avatar');
        }

    }
}
