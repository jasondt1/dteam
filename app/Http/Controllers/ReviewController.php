<?php

namespace App\Http\Controllers;

use App\Models\GameReview;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ReviewController extends Controller
{
    public function add(Request $request){
        $rules = [
            'game_id' => 'required|numeric',
            'review' => 'required',
            'recommend' => 'required|numeric|min:1|max:2',
        ];

        $messages = [
            'recommend.required' => 'The recommendation vote is required.',
            'recommend.numeric' => 'The recommendation vote is required.',
            'recommend.min' => 'The recommendation vote is required.',
            'recommend.max' => 'The recommendation vote is required.',
        ];

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $newReview = new GameReview();

        $newReview->game_id = $request->game_id;
        $newReview->user_id = auth()->user()->id;
        $newReview->rating_type_id = $request->recommend;
        $newReview->content = $request->review;

        $newReview->save();
        return redirect()->route('game-detail', ['id' => $request->game_id]);
    }

    public function showUserReviews($id){
        $user = User::where('unique_code', $id)->first();
        return view('user/reviews', ['user' => $user]);
    }
}
