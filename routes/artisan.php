<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;

/**
 * 'artisan' middleware applied to all routes
 *
 * @see \App\Providers\Route::mapArtisanRoutes
 * @see \modules\OfflinePayments\Routes\artisan.php for module example
 */

/**
 * 1. Running the config:clear Command on Shared Hosting
 * example : http://localhost:8000/artisan/config-clear
 * Test Ok
 */
Route::get('/config-clear', function() {
    Artisan::call('config:clear');
    return 'Configuration cache cleared!';
});

/**
 * 2. Running the config:cache Command on Shared Hosting
 * example : http://localhost:8000/artisan/config-cache
 * Test Ok
 */
Route::get('/config-cache', function() {
    Artisan::call('config:cache');
    return 'Configuration cache  successfully!';
});

/**
 * 3. Running the cache:clear Command on Shared Hosting
 * example : http://localhost:8000/artisan/cache-clear
 * Test Ok
 */
Route::get('/cache-clear', function() {
    Artisan::call('cache:clear');
    return 'Application cache cleared!';
});

/**
 * 4. Running the view:cache Command  on Shared Hosting
 * example : http://localhost:8000/artisan/view-cache
 * Test Ok
 */
Route::get('/view-cache', function() {
    Artisan::call('view:cache');
    return 'Compiled views cleared! <br> Blade templates cached successfully!';
});

/**
 * 5. Running the view:clear Command on Shared Hosting
 * example : http://localhost:8000/artisan/view-clear
 * Test Ok
 */
Route::get('/view-clear', function() {
    Artisan::call('view:clear');
    return 'Compiled views cleared!';
});

/**
 * 6. Running the route:cache Command on Shared Hosting
 * example : http://localhost:8000/artisan/route-cache
 * Test Ok
 */
Route::get('/route-cache', function() {
    Artisan::call('route:cache');
    return 'Route cache cleared! <br> Routes cached successfully!';
});

/**
 * 7. Running the route:clear Command on Shared Hosting
 * example : http://localhost:8000/artisan/route-clear
 * Test Ok
 */
Route::get('/route-clear', function() {
    Artisan::call('route:clear');
    return 'Route cache cleared!';
});

/**
 * 8. Running the storage:link Command on Shared Hostig
 * example : http://localhost:8000/artisan/storage-link
 * Test Ok
 */
Route::get('/storage-link', function() {
    Artisan::call('storage:link');
    return 'The links have been created.';
});

/**
 * 9. Running the optimize Command on Shared Hostig
 * example : http://localhost:8000/artisan/optimize
 * Test Ok
 */
Route::get('/optimize', function() {
    Artisan::call('optimize');
    return 'Config cache,cached,route and file are Optimized';
});

/**
 * 10. Running the migrate Command on Shared Hosting
 * example : http://localhost:8000/artisan/migrate
 * Test Ok
 */
Route::get('/migrate', function() {
    Artisan::call('migrate');
    return Artisan::output();
});

