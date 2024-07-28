<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;

class CheckUser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $routeName = Route::currentRouteName();

        Log::info('Middleware check', [
            'route_name' => $routeName,
            'user_id' => Auth::id(),
            'nickname' => Auth::user() ? Auth::user()->nickname : null
        ]);

        if(Auth::check() && Auth::user()->role =='user' && $routeName != 'verification' && $routeName != 'logout' && $routeName != 'resend' && $routeName != 'verify'){
            $status = session('status');
            if($status == 'unverified'){
                return redirect()->route('verification');
            }
        }

        if (Auth::check() && Auth::user()->role == 'user' && Auth::user()->nickname == null && $routeName !== 'setup-profile' && $routeName != 'logout' && $routeName != 'update-setup') {
            Log::info('Redirecting to setup-profile');
            return redirect()->route('setup-profile');
        }

        if (Auth::check() && Auth::user()->role == 'publisher' && Auth::user()->publisher == null && $routeName !== 'publisher-welcome' && $routeName != 'logout' && $routeName != 'data-publisher-setup') {
            Log::info('Redirecting to setup-profile');
            return redirect()->route('publisher-welcome');
        }

        return $next($request);
    }
}
