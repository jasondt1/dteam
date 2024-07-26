<?php

namespace App\Http\Controllers;

use App\Models\Friendlist;
use App\Models\FriendRequest;
use App\Models\User;
use Illuminate\Http\Request;

class FriendController extends Controller
{
    public function addFriend(Request $request){
        $user_1 = User::find(auth()->user()->id);
        $user_2 = User::where('id', $request->id)->first();

        $friend_request = new FriendRequest();
        $friend_request->user_id_1 = $user_1->id;
        $friend_request->user_id_2 = $user_2->id;
        $friend_request->status = "pending";
        $friend_request->save();

        return redirect()->back();
    }

    public function cancelRequest(Request $request){
        $friend_request = FriendRequest::where('user_id_1', auth()->user()->id)->where('user_id_2', $request->id)->first();
        $friend_request->delete();

        return redirect()->back();
    }

    public function declineFriendRequest(Request $request){
        $friend_request = FriendRequest::where('user_id_1', $request->id)->where('user_id_2', auth()->user()->id)->first();
        $friend_request->delete();

        return redirect()->back();
    }

    public function acceptFriendRequest(Request $request){
        $friend_request = FriendRequest::where('user_id_1', $request->id)->where('user_id_2', auth()->user()->id)->first();
        $friend_request->delete();

        $friendlist = new Friendlist();
        $friendlist->user_id_1 = $request->id;
        $friendlist->user_id_2 = auth()->user()->id;
        $friendlist->save();

        return redirect()->back();
    }

    public function removeFriend(Request $request){
        $friendlist = Friendlist::where(function($query) use ($request) {
            $query->where('user_id_1', $request->id)
                  ->where('user_id_2', auth()->user()->id);
        })->orWhere(function($query) use ($request) {
            $query->where('user_id_1', auth()->user()->id)
                  ->where('user_id_2', $request->id);
        })->first();

        if ($friendlist) {
            $friendlist->delete();
        }

        return redirect()->back();
    }

    public function show(){
        $user = User::where('unique_code', request('id'))->first();
        $friendswith = $user->friends_with ?? collect();
        $friendsof = $user->friends_of ?? collect();
        $friends = $friendswith->concat($friendsof);
        $friends = $friends->sortBy(function($friend) {
            return $friend->nickname;
        });

        $user->mutual_friend_count = $this->getMutualFriendsCount(auth()->user(), $user);

        return view('user/friends', ['user' => $user, 'friends' => $friends]);
    }

    public function getMutualFriendsCount($user1, $user2){
        $user1Friends = $user1->friends_of->pluck('id')->merge($user1->friends_with->pluck('id'));
        $user2Friends = $user2->friends_of->pluck('id')->merge($user2->friends_with->pluck('id'));

        return $user1Friends->intersect($user2Friends)->count();
    }

    public function showPending(){
        $user = User::where('unique_code', request('id'))->first();

        if (!$user) {
            return redirect()->route('store')->with('error', 'User not found');
        }

        if ($user->id != auth()->user()->id) {
            return redirect()->route('store');
        }

        $received = $user->received_friend_requests()
            ->with('user_1')
            ->orderBy('created_at', 'desc')
            ->get();

        $sent = $user->sent_friend_requests()
            ->with('user_2')
            ->orderBy('created_at', 'desc')
            ->get();

        foreach ($received as $request) {
                $request->mutualFriendsCount = $this->getMutualFriendsCount(auth()->user(), $request->user_1);
            }

        foreach ($sent as $request) {
                $request->mutualFriendsCount = $this->getMutualFriendsCount(auth()->user(), $request->user_2);
            }

        return view('user/pending-invite', ['user' => $user, 'received' => $received, 'sent' => $sent]);
    }

    public function showMutualFriends(){
        $user1 = User::find(auth()->user()->id);
        $user2 = User::where('unique_code', request('id'))->first();
        $user1Friends = $user1->friends_of->merge($user1->friends_with);
        $user2Friends = $user2->friends_of->merge($user2->friends_with);
        $friends = $user1Friends->intersect($user2Friends);

        $friends = $friends->sortBy(function($friend) {
            return $friend->nickname;
        });

        $user2->mutual_friend_count = $this->getMutualFriendsCount(auth()->user(), $user2);

        return view('user/mutual-friend', ['user' => $user2, 'friends' => $friends]);
    }

    public function showAddFriend(){
        $user = User::where('unique_code', request('id'))->first();
        return view('user/add-friend', ['user' => $user]);
    }

    public function getUserByUniqueCode(){
        $user = User::with('country')->where('unique_code', request('id'))->first();
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }
        $user->mutual_friend_count = $this->getMutualFriendsCount(auth()->user(), $user);

        if($user->id == auth()->user()->id){
            $user->invite_btn = "";
        }
        else if($user->friends_with->contains(auth()->user()->id) || $user->friends_of->contains(auth()->user()->id)){
            $user->invite_btn = "You're already friend with this user";
        }
        else if($user->received_friend_requests->contains('user_id_1', auth()->user()->id)){
            $user->invite_btn = "You sent a friend request to this user";
        }
        else if($user->sent_friend_requests->contains('user_id_2', auth()->user()->id)){
            $user->invite_btn = "This user sent you a friend request";
        }
        else{
            $user->invite_btn = "enabled";
        }

        return response()->json($user);
    }
}
