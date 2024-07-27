<?php

namespace App\Http\Controllers;

use App\Models\Game;
use App\Models\GameGift;
use App\Models\GameImage;
use App\Models\GameLibrary;
use App\Models\Genre;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class GameController extends Controller
{
    public function getAll(Request $request){
        $query = Game::query();

        if ($request->has('search') && $request->search != '') {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        $query->orderBy('updated_at', 'desc');
        $query->where('publisher_id', '=', auth()->user()->publisher->id);
        $query->with('age_rating');
        $query->with('genres');

        $games = $query->get();
        $games = $games->sortByDesc('released_date');

        return view('publisher/games/manage-game', ['games' => $games]);
    }

    public function addPage(){
        $genres = Genre::where('is_active', true)->get();
        return view('publisher/games/add-game', compact('genres'));
    }

    public function add(Request $request){
        $rules = [
            'game_title' => 'required',
            'game_brief_description' => 'required',
            'game_full_description' => 'required',
            'release_date' => 'required|date',
            'genres' => 'required|array|max:3',
            'video_url' => 'required',
            'image_urls' => 'required|array|min:5',
            'original_price' => 'required|numeric',
            'age_rating' => 'required|numeric',
            'discount_percentage' => 'numeric',
        ];

        $messages = [
            'video_url' => 'The video is required.',
            'image_urls' => 'At least 5 images are required.',
        ];

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        if($request->discount_percentage){
            $discount = $request->discount_percentage;
        }
        else{
            $discount = 0;
        }

        $newGame = new Game();

        $newGame->title = $request->game_title;
        $newGame->brief_description = $request->game_brief_description;
        $newGame->full_description = $request->game_full_description;
        $newGame->released_date = $request->release_date;
        $newGame->trailer_url = $request->video_url;
        $newGame->price = $request->original_price;
        $newGame->publisher_id = auth()->user()->publisher->id;
        $newGame->discount_percentage = $discount;
        $newGame->age_rating_id = $request->age_rating;

        $newGame->save();

        foreach ($request->image_urls as $imageUrl) {
            $image = new GameImage();
            $image->game_id = $newGame->id;
            $image->image_url = $imageUrl;
            $image->save();
        }

        $newGame->genres()->attach($request->genres);

        return redirect()->route('game-detail', ['id' => $newGame->id]);
    }

        public function update(Request $request, $id)
    {
        $rules = [
            'game_title' => 'required',
            'game_brief_description' => 'required',
            'game_full_description' => 'required',
            'release_date' => 'required|date',
            'genres' => 'required|array|max:3',
            'video_url' => 'required',
            'image_urls' => 'required|array|min:5',
            'original_price' => 'required|numeric',
            'age_rating' => 'required|numeric',
            'discount_percentage' => 'numeric',
        ];

        $messages = [
            'video_url.required' => 'The video is required.',
            'image_urls.required' => 'At least 5 images are required.',
        ];

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $game = Game::findOrFail($id);
        if ($game->publisher_id !== auth()->user()->publisher->id) {
            return redirect()->route('manage-game');
        }

        $game->title = $request->game_title;
        $game->brief_description = $request->game_brief_description;
        $game->full_description = $request->game_full_description;
        $game->released_date = $request->release_date;
        $game->trailer_url = $request->video_url;
        $game->price = $request->original_price;
        $game->discount_percentage = $request->discount_percentage ?: 0;
        $game->age_rating_id = $request->age_rating;

        $game->save();

        GameImage::where('game_id', $game->id)->delete();

        foreach ($request->image_urls as $imageUrl) {
            $image = new GameImage();
            $image->game_id = $game->id;
            $image->image_url = $imageUrl;
            $image->save();
        }

        $game->genres()->sync($request->genres);

        return redirect()->route('game-detail', ['id' => $game->id]);
    }


    public function getDetail(Request $request) {
        $game = Game::with('game_images', 'age_rating', 'publisher', 'genres')->find($request->id);

        if (!$game) {
            return redirect()->back();
        }

        if ($game->discount_percentage > 0) {
            $game->discount_price = $game->price - ($game->price * $game->discount_percentage / 100);
        }

        $reviews = $game->game_reviews()
            ->with([
                'user' => function ($query) {
                    $query->withCount(['game_libraries', 'game_reviews']);
                }, 'rating_type'
            ])
            ->get();

        $totalReviews = $reviews->count();

        $recentReviews = $reviews->filter(function ($review) {
            return $review->created_at >= Carbon::now()->subMonth();
        })->count();

        $ratingTypeCountsTotal = $reviews->groupBy('rating_type_id')->map(function ($group) {
            return $group->count();
        });

        $ratingType1CountTotal = $ratingTypeCountsTotal->get(1, 0);
        $ratingType2CountTotal = $ratingTypeCountsTotal->get(2, 0);

        $totalSentiment = $this->calculateSentiment($ratingType1CountTotal, $ratingType2CountTotal, $totalReviews);
        $recentReviewsCollection = $reviews->filter(function ($review) {
            return $review->created_at >= Carbon::now()->subMonth();
        });

        $ratingTypeCountsRecent = $recentReviewsCollection->groupBy('rating_type_id')->map(function ($group) {
            return $group->count();
        });

        $ratingType1CountRecent = $ratingTypeCountsRecent->get(1, 0);
        $ratingType2CountRecent = $ratingTypeCountsRecent->get(2, 0);

        $recentSentiment = $this->calculateSentiment($ratingType1CountRecent, $ratingType2CountRecent, $recentReviews);

        return view('user/game-details', [
            'game' => $game,
            'totalReviews' => $totalReviews,
            'recentReviews' => $recentReviews,
            'totalSentiment' => $totalSentiment,
            'recentSentiment' => $recentSentiment,
            'reviews' => $reviews
        ]);
    }

    private function calculateSentiment($positiveCount, $negativeCount, $totalReviews) {
        if ($totalReviews == 0) {
            return "No Reviews";
        }

        $positivePercentage = ($positiveCount / $totalReviews) * 100;

        if ($positivePercentage < 40) {
            return "Mostly Negative";
        } elseif ($positivePercentage <= 70) {
            return "Mixed";
        } else {
            return "Mostly Positive";
        }
    }

    public function viewStore(){
        $popularGames = Game::withCount('game_libraries')->orderBy('game_libraries_count', 'desc')->take(5)->get();
        $discountedGames = Game::where('discount_percentage', '>', 0)->get();
        $discountedGames = $discountedGames->take(10);

        $genres = Genre::where('is_active', true)->get();
        return view('user/store', compact('popularGames', 'discountedGames', 'genres'));
    }

    public function showUserGames($id){
        $user = User::where('unique_code', $id)->first();
        return view('user/games', ['user' => $user]);
    }

    public function acceptGift($id){
        $gift = GameGift::find($id);

        $library = new GameLibrary();
        $library->user_id = $gift->receiver_id;
        $library->game_id = $gift->game_id;
        $library->discount_percentage = $gift->discount_percentage;

        if ($library->user->game_libraries->contains('game_id', $library->game_id)) {
            return redirect()->back();
        }

        $library->save();

        $gift->status = 1;
        $gift->save();

        return view('user/gifts');
    }

    public function viewEdit(){
        $game = Game::find(request('id'));
        $genres = Genre::where('is_active', true)->get();
        if ($game->publisher_id !== auth()->user()->publisher->id) {
            return redirect()->route('manage-game');
        }
        return view('publisher/games/edit-game', ['game' => $game, 'genres' => $genres]);
    }
}
