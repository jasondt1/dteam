<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\URL;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Paginator::useTailwind();
        // Force HTTPS when app URL is https (e.g., production behind proxy)
        $scheme = parse_url(config('app.url'), PHP_URL_SCHEME);
        if ($scheme === 'https') {
            URL::forceScheme('https');
        }
    }
}
