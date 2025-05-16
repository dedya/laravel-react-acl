<?php

namespace App\Providers;
use Illuminate\Support\ServiceProvider;
use Inertia\Inertia;
use Illuminate\Support\Facades\Lang;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Inertia::share([
            'labels' => function () {
                return Lang::get('labels');
            },
             'permissions' => fn () => auth()->check()
                ? auth()->user()->getAllPermissions()->pluck('name')
            : [],
    ]);
    }
}
