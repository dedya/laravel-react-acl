<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\UserFrontendController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\RolePermissionController;
use App\Http\Controllers\Auth\GoogleController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
/*     return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]); */

    return redirect()->route(Auth::check() ? 'dashboard' : 'login');

});

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::get('/auth/google/redirect', [GoogleController::class, 'redirect'])->name('google.redirect');
Route::get('/auth/google/callback', [GoogleController::class, 'callback'])->name('google.callback');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::get('/users', [UserFrontendController::class, 'index'])->name('users.index');
    Route::get('/users/create', [UserFrontendController::class, 'create'])->name('users.create');
    Route::post('/users', [UserFrontendController::class, 'store'])->name('users.store');
    Route::get('/users/{user}/edit', [UserFrontendController::class, 'edit'])->name('users.edit');
    Route::put('/users/{user}', [UserFrontendController::class, 'update'])->name('users.update');
    Route::delete('/users/{user}', [UserFrontendController::class, 'destroy'])->name('users.destroy');
    Route::patch('/users/{user}/enable', [UserFrontendController::class, 'enable'])->name('users.enable');
    Route::patch('/users/{user}/disable', [UserFrontendController::class, 'disable'])->name('users.disable');

    Route::get('/roles', [RolePermissionController::class, 'index'])->name('roles.index');
    Route::get('/roles/create', [RolePermissionController::class, 'create'])->name('roles.create');
    Route::post('/roles', [RolePermissionController::class, 'store'])->name('roles.store');
    Route::get('/roles/{role}/edit', [RolePermissionController::class, 'edit'])->name('roles.edit');
    Route::put('/roles/{role}', [RolePermissionController::class, 'update'])->name('roles.update');
    Route::delete('/roles/{role}', [RolePermissionController::class, 'destroy'])->name('roles.destroy');

});

require __DIR__.'/auth.php';
