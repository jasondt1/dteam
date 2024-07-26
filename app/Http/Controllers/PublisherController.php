<?php

namespace App\Http\Controllers;

use App\Mail\Mailer;
use App\Models\Publisher;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class PublisherController extends Controller
{
    public function getAll(Request $request){
        $query = Publisher::query();

        if ($request->has('search') && $request->search != '') {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        $query->orderBy('created_at', 'desc');

        $publishers = $query->paginate(10);

        return view('admin/publishers/manage-publisher', ['publishers' => $publishers]);
    }

    public function add(Request $request){
        $rules = [
            'publisher_email' => 'required|unique:users,email|email|max:255',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $password = str_pad(random_int(0, 999999999999), 12, '0', STR_PAD_LEFT);
        $newUser = new User();
        $newUser->email = $request->publisher_email;
        $newUser->password = bcrypt($password);
        $newUser->role = 'publisher';
        $newUser->save();

        $details = [
            'title' => 'DTeam Publisher Account Creation',
            'email' => $request->publisher_email,
            'password' => $password,
        ];

        Mail::to($request->publisher_email)->send(new Mailer($details));

        $request->session()->put('email', $request->publisher_email);

        return redirect()->route('publisher-add-success');
    }

    public function success(Request $request){
        $email = $request->session()->get('email');
        return view('admin/publishers/add-publisher-success', ['email' => $email]);
    }

    public function welcome(){
        $publisher = Publisher::where('user_id', Auth::user()->id)->first();
        if($publisher){
            return redirect()->route('manage-game');
        }
        else{
            return view('publisher/profiles/publisher-welcome');
        }
    }

    public function setup(Request $request){
        $rules = [
            'publisher_name' => 'required|unique:publishers,name|max:255',
            'publisher_website' => 'required|unique:publishers,website|max:255|url',
            'image_url' => 'required|url',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $publisher = new Publisher();
        $publisher->name = $request->publisher_name;
        $publisher->website = $request->publisher_website;
        $publisher->image_url = $request->image_url;
        $publisher->user_id = Auth::user()->id;
        $publisher->save();

        return redirect()->route('manage-gane');
    }

    public function edit(){
        $userId = Auth::user()->id;
        $publisher = Publisher::with('user')->where('user_id', $userId)->first();

        return view('publisher/profiles/edit-publisher-profile', ['publisher' => $publisher]);
    }

    public function update(Request $request){
        $rules = [
            'publisher_name' => [
                'required',
                'max:255',
                Rule::unique('publishers', 'name')->ignore($request->id),
            ],
            'publisher_website' => [
                'required',
                'url',
                'max:255',
                Rule::unique('publishers', 'website')->ignore($request->id),
            ],
            'image_url' => 'required|url',
            'current_password' => [
                'required',
                function ($attribute, $value, $fail) {
                    if (!Auth::check() || !Hash::check($value, Auth::user()->password)) {
                        $fail('The current password is incorrect.');
                    }
                },
            ],
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $publisher = Publisher::findOrFail($request->id);
        $publisher->name = $request->publisher_name;
        $publisher->website = $request->publisher_website;
        $publisher->image_url = $request->image_url;
        $publisher->save();

        return view('publisher/profiles/edit-publisher-profile', ['publisher' => $publisher]);
    }

    public function showPublisher($name){
        $publisher = Publisher::where('name', $name)->first();
        $games = $publisher->games;
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
        return view('user/view-publisher', ['publisher' => $publisher, 'games' => $games]);
    }
}
