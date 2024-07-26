<?php

namespace App\Http\Controllers;

use App\Models\Game;
use App\Models\Genre;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SearchController extends Controller
{
    public function getMutualFriendsCount($user1, $user2){
        $user1Friends = $user1->friends_of->pluck('id')->merge($user1->friends_with->pluck('id'));
        $user2Friends = $user2->friends_of->pluck('id')->merge($user2->friends_with->pluck('id'));
        return $user1Friends->intersect($user2Friends)->count();
    }

    public function searchUser(){
        $user = Auth::user();
        $search = request('nickname', '');
        $users = User::where('nickname', 'like', '%'.$search.'%')->paginate(10)->appends(['nickname' => $search]);

        foreach ($users as $u) {
            $u->mutual_friend_count = $this->getMutualFriendsCount($user, $u);

            if ($u->id == auth()->user()->id) {
                $u->invite_btn = "";
            } elseif ($u->friends_with->contains(auth()->user()->id) || $u->friends_of->contains(auth()->user()->id)) {
                $u->invite_btn = "You're already friend with this user";
            } elseif ($u->received_friend_requests->contains('user_id_1', auth()->user()->id)) {
                $u->invite_btn = "You sent a friend request to this user";
            } elseif ($u->sent_friend_requests->contains('user_id_2', auth()->user()->id)) {
                $u->invite_btn = "This user sent you a friend request";
            } else {
                $u->invite_btn = "enabled";
            }
        }
        return view('user/search-user', compact('users', 'user', 'search'));
    }

    public function searchGameAsync(){
        $search = request('query', '');
        $games = Game::where('title', 'like', '%'.$search.'%')->get();
        $games->load('game_images');
        if(Auth::user()){
            foreach ($games as $game) {
                $game->owned = auth()->user()->game_libraries->contains('id', $game->id);
            }
        }
        foreach ($games as $game) {
            if($game->discount_percentage > 0){
                $game->price = $game->price - ($game->price * $game->discount_percentage / 100);
            }
        }
        return response()->json($games);
    }

    public function searchGame(Request $request)
    {
        $search = $request->input('title', '');
        $sort_by = $request->input('sort_by', '');
        $user = Auth::user();

        $query = Game::where('title', 'like', '%' . $search . '%');
        if ($sort_by) {
            switch ($sort_by) {
                case 'popularity':
                    $query->withCount('game_libraries')->orderBy('game_libraries_count', 'desc');
                    break;
                case 'reviews':
                    $query->withCount('game_reviews')->orderBy('game_reviews_count', 'desc');
                    break;
                case 'name':
                    $query->orderBy('title');
                    break;
                case 'release_date':
                    $query->orderBy('released_date', 'desc');
                    break;
                case 'lowest_price':
                    $query->selectRaw('games.*, (price - (price * discount_percentage / 100)) as discounted_price')
                          ->orderBy('discounted_price');
                    break;
                case 'highest_price':
                    $query->selectRaw('games.*, (price - (price * discount_percentage / 100)) as discounted_price')
                          ->orderBy('discounted_price', 'desc');
                    break;
                default:
                    $query->withCount('game_libraries')->orderBy('game_libraries_count', 'desc');
                    break;
            }
        } else {
            $query->withCount('game_libraries')->orderBy('game_libraries_count', 'desc');
        }

        if ($request->filled('max_price')) {
            $max_price = $request->input('max_price') != 585000 ? $request->input('max_price') : 99999999999;
            $query->whereRaw('(price - (price * discount_percentage / 100)) <= ?', [$max_price]);
        }

        if ($request->filled('publisher')) {
            $query->where('publisher_id', $request->input('publisher'));
        }

        if ($request->filled('special_offers')) {
            $query->where('discount_percentage', '>', 0);
        }

        if ($request->filled('hide_free')) {
            $query->where('price', '>', 0);
        }

        if ($request->filled('hide_library')) {
            $query->whereNotIn('id', $user->game_libraries->pluck('id'));
        }

        if ($request->filled('hide_wishlist')) {
            $query->whereNotIn('id', $user->game_wishlists->pluck('id'));
        }

        if ($request->filled('genres')) {
            $query->whereHas('genres', function ($q) use ($request) {
                $q->whereIn('genres.id', $request->input('genres'));
            });
        }

        $perPage = 12;
        $games = $query->paginate($perPage);
        $games->load('game_reviews');
        $games->load('game_images');
        foreach ($games as $game) {
            $positive = 0;
            $negative = 0;
            foreach ($game->game_reviews as $review) {
                if ($review->rating_type_id == 1) {
                    $positive++;
                } elseif ($review->rating_type_id == 2) {
                    $negative++;
                }
            }
            $total_reviews = $game->game_reviews->count();

            if ($total_reviews == 0) {
                $game->rating = "No reviews";
            } else {
                $positive_percentage = ($positive / $total_reviews) * 100;

                if ($positive_percentage >= 40 && $positive_percentage <= 70) {
                    $game->rating = "Mixed";
                } elseif ($positive > $negative) {
                    $game->rating = "Positive";
                } else {
                    $game->rating = "Negative";
                }
            }
        }

        $genres = Genre::all();

        $currentPage = $games->currentPage();

        if($currentPage >= 2){
            return response()->json(['games' => $games]);
        }

        return view('user.search-game', compact('games', 'search', 'genres'));
    }
}
