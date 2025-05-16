<?php
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;
use App\Models\User;

class GoogleController extends Controller
{
    public function redirect()
    {
        return Socialite::driver('google')->redirect();
    }

    public function callback()
    {
        try {
            $googleUser = Socialite::driver('google')->user();
            $user = User::where('email', $googleUser->getEmail())->first();

            if (!$user) {
                // Email not registered
                return redirect()->route('login')->withErrors([
                    'email' => 'Your Google account is not registered in our system.'
                ]);
            }

            Auth::login($user, true);
            return redirect()->intended('/dashboard');
        } catch (\Exception $e) {
            return redirect()->route('login')->withErrors([
                'email' => 'Failed to login with Google.'
            ]);
        }
    }
}