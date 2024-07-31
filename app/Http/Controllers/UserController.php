<?php

namespace App\Http\Controllers;

use App\Mail\ForgotPassword;
use App\Models\Country;
use App\Models\User;
use App\Models\WalletCode;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use App\Mail\Mailer;
use App\Mail\Verification;
use Illuminate\Support\Facades\Session;

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
        $newUser->background_url = 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fashen_hush.gif?alt=media&token=a877b90b-c8f8-4c19-b91a-c4e7b6311bb1';
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
                return redirect()->route('manage-publisher');
            }
            else if(Auth::user()->role == 'publisher'){
                return redirect()->route('publisher-welcome');
            }
            else{
                if(Auth::user()->nickname == null){
                    session(['status' => 'verified']);
                }
                else{
                    $code = substr(str_shuffle('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, 5);
                    $hashedCode = bcrypt($code);
                    session(['code' => $hashedCode]);
                    session(['send_time' => time()]);
                    session(['status' => 'unverified']);

                    $details = [
                        'title' => 'New Sign In Request',
                        'email' => Auth::user()->email,
                        'code' => $code,
                    ];
                    Mail::to(Auth::user()->email)->send(new Verification($details));
                }
                return redirect()->back();
            }
        }

        return back()->withErrors(['invalid' => 'Invalid credentials'])->withInput();
    }

    public function forgotPassword(Request $request){
        $rules = [
            'email' => 'required|email',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $user = User::where('email', $request->email)->first();

        if ($user) {
            $password = str_pad(random_int(0, 99999999), 8, '0', STR_PAD_LEFT);
            $user->password = bcrypt($password);
            $user->save();

            $details = [
                'title' => 'Forgot Password',
                'email' => $request->email,
                'password' => $password,
            ];

            Mail::to($request->email)->send(new ForgotPassword($details));

            return redirect()->route('login');
        }

        return back()->withErrors(['email' => 'Email not found'])->withInput();
    }

    public function verify(Request $request){
        $rules = [
            'code' => 'required|size:5',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $code = $request->code;
        $upper = strtoupper($code);
        $hashedCode = session('code');
        $sendTime = session('send_time');
        $status = session('status');

        if (password_verify($upper, $hashedCode) && time() - $sendTime < 300 && $status === 'unverified') {
            session(['status' => 'verified']);
            return redirect()->route('store');
        }

        if (time() - $sendTime >= 300) {
            return back()->withErrors(['code' => 'Invalid code']);
        }

        return back()->withErrors(['code' => 'Invalid code']);

    }

    public function resend(){
        $code = substr(str_shuffle('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, 5);
        $hashedCode = bcrypt($code);
        session(['code' => $hashedCode]);
        session(['send_time' => time()]);
        session(['status' => 'unverified']);

        $details = [
            'title' => 'New Sign In Request',
            'email' => Auth::user()->email,
            'code' => $code,
        ];
        Mail::to(Auth::user()->email)->send(new Verification($details));

        return back();
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

    public function updateSetup(Request $request){
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

        return redirect()->route('store');
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

        $game_libraries->each(function ($item) {
            $item->type = 'library';
        });
        $game_gifts->each(function ($item) {
            $item->type = 'gift';
        });
        $wallets->each(function ($item) {
            $item->type = 'wallet';
        });

        $libraryHistory = $game_libraries->sortByDesc(function ($item) {
            return $item->pivot->created_at;
        });
        $giftHistory = $game_gifts->sortByDesc('created_at');

        $merged = $libraryHistory->concat($giftHistory)->concat($wallets);

        $sorted = $merged->sortByDesc(function ($item) {
            if ($item->type === 'library') {
                return $item->pivot->created_at;
            } elseif ($item->type === 'gift') {
                return $item->created_at;
            } elseif ($item->type === 'wallet') {
                return $item->used_at;
            }
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

    public function showVerification(){
        return view('user/2fa');
    }
}
