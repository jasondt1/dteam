<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\User;
use App\Models\WalletCode;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function register(Request $request){
        function generateUniqueCode() {
            $characters = '0123456789';
            $codeLength = 10;
            $code = '';

            do {
                $code = '';
                for ($i = 0; $i < $codeLength; $i++) {
                    $code .= $characters[rand(0, strlen($characters) - 1)];
                }
            } while (User::where('unique_code', $code)->exists());

            return $code;
        }

        $rules = [
            'email' => 'required|email|unique:users|max:255',
            'password' => 'required|min:8',
            'confirm-password' => 'required|min:8|same:password',
            'agreement' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $newUser = new User();

        $newUser->email = $request->email;
        $newUser->password = bcrypt($request->password);
        $newUser->role = 'user';
        $newUser->wallet = 0;
        $newUser->point = 0;
        $newUser->profile_picture_url = 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/';
        $newUser->background_url = 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac';
        $newUser->unique_code = generateUniqueCode();

        $newUser->save();

        return redirect()->route('login');
    }

    public function login(Request $request){
        $rules = [
            'email' => 'required|email',
            'password' => 'required',
        ];

        $remember = $request->has('remember') ? true : false;
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors(['invalid' => 'Invalid credentials'])->withInput();
        }

        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials, $remember)) {
            if(Auth::user()->role == 'admin'){
                return redirect()->route('manage-genre');
            }
            else if(Auth::user()->role == 'publisher'){
                return redirect()->route('publisher-welcome');
            }
            else{
                if(Auth::user()->nickname == null){
                    return redirect()->route('setup-profile');
                }
                return redirect()->route('store');
            }
        }

        return back()->withErrors(['invalid' => 'Invalid credentials'])->withInput();
    }

    public function changePassword(Request $request){
        $rules = [
            'current_password' => [
                'required',
                function ($attribute, $value, $fail) {
                    if (!Auth::check() || !Hash::check($value, Auth::user()->password)) {
                        $fail('The current password is incorrect.');
                    }
                },
            ],
            'new_password' => 'required|min:8',
            'confirm_new_password' => 'required|min:8|same:new_password',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator);
        }

        $user = User::find(Auth::user()->id);
        $user->password = bcrypt($request->input('new_password'));
        $user->save();

        return back()->with('success', 'Password changed successfully!');
    }

    public function editGeneral(){
        $countries = Country::all();
        return view('user/edit-profile-general', ['countries' => $countries]);
    }

    public function updateGeneral(Request $request){
        $rules = [
            'nickname' => 'required|max:255',
            'real_name' => 'required|max:255',
            'country' => 'required|exists:countries,id',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator);
        }

        $user = User::find(Auth::user()->id);

        $user->nickname = $request->nickname;
        $user->real_name = $request->real_name;
        $user->country_id = $request->country;
        $user->bio = $request->bio;

        $user->save();

        return back();
    }

    public function updateAvatar(Request $request){
        $rules = [
            'image_url' => 'required',
        ];

        $messages = [
            'image_url.required' => 'Profile picture is required',
        ];

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return back()->withErrors($validator);
        }

        $user = User::find(Auth::user()->id);

        $user->profile_picture_url = $request->image_url;

        $user->save();

        return back();
    }

    public function updateBackground(Request $request){
        $user = User::find(Auth::user()->id);
        $user->background_url = $request->image_url;

        $user->save();
        return back();
    }

    public function editSecurity(){
        return view('user/edit-profile-security');
    }

    public function editAvatar(){
        return view('user/edit-profile-avatar');
    }

    public function editBackground(){
        return view('user/edit-profile-background');
    }

    public function setupProfile(){
        $countries = Country::all();
        return view('user/setup-profile', ['countries' => $countries]);
    }

    public function showProfile(){
        $user = User::where('unique_code', request('id'))->first();
        $friendswith = $user->friends_with ?? collect();
        $friendsof = $user->friends_of ?? collect();
        $friends = $friendswith->concat($friendsof);
        $friends = $friends->sortByDesc(function($friend) {
            return $friend->game_libraries->count();
        });

        return view('user/profile', ['user' => $user, 'friends' => $friends]);
    }

    public function showHistory() {
        $user = Auth::user();
        $game_libraries = $user->game_libraries;
        $game_gifts = $user->sent_gifts;
        $wallets = WalletCode::where('user_id', $user->id)->get();
        $game_gifts->load('game');

        $history = $game_libraries->concat($game_gifts)->sortByDesc('created_at');
        $history->each(function ($item) {
            $item->type = 'history';
        });
        $wallets->each(function ($item) {
            $item->type = 'wallet';
        });
        $merged = $history->concat($wallets);
        $sorted = $merged->sortByDesc(function ($item) {
            return $item->type === 'history' ? $item->created_at : $item->used_at;
        });

        $currentPage = Paginator::resolveCurrentPage();
        $perPage = 10;
        $currentItems = $sorted->slice(($currentPage - 1) * $perPage, $perPage)->values();
        $total = $sorted->count();

        $paginatedItems = new LengthAwarePaginator($currentItems, $total, $perPage, $currentPage, [
            'path' => Paginator::resolveCurrentPath(),
        ]);

        return view('user/history', ['histories' => $paginatedItems]);
    }
}
