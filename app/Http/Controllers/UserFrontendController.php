<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;
use Spatie\Permission\Models\Role;
use App\Models\UserGroup as Group; 
use App\Http\Requests\UserRequest;
use Illuminate\Support\Facades\Log;

class UserFrontendController extends Controller
{
    function __construct() {
        $this->middleware('permission:create-user')->only('create', 'store', 'enable','disable');
        $this->middleware('permission:read-user')->only('index','edit');
        $this->middleware('permission:update-user')->only('update','enable','disable');
        $this->middleware('permission:delete-user')->only('destroy');
    }

    public function index(Request $request)
    {
        Log::info('USER LIST');

         $query = User::with('roles:id,name')->select('id', 'name', 'email','is_active','photo');

        if ($request->filled('name')) {
            $query->where('name', 'like', '%' . $request->name . '%');
        }
        if ($request->filled('email')) {
            $query->where('email', 'like', '%' . $request->email . '%');
        }
        
        return Inertia::render('Users/Index', [
            'users' => $query->paginate(10)->withQueryString(),
            'filters' => $request->only(['name', 'email']),
            'alertTimer' => config('app.alert_timer'),            
         ]);
    }

    public function create()
    {
        $roles = Role::all(); // Fetch all roles using Spatie
        $groups = Group::all(); // Fetch groups (assuming you have a Group model)
    
        return Inertia::render('Users/Form', [
            'user' => null,
            'roles' => $roles,
            'groups' => $groups,
            'alertTimer' => config('app.alert_timer'),
        ]);
    }

    public function store(UserRequest $request)
    {
        $validated = $request->validated();
        Log::info('CREATE DATA', $request->all());
        
        if ($request->hasFile('photo')) {
            $validated['photo'] = $request->file('photo')->store('photos', 'public');
        }

        $validated['password'] = Hash::make($validated['password']);
        $user = User::create($validated);

        $user->assignRole($validated['role']); // Assign role using Spatie
        $message = "{$user->name} is updated";

        return redirect()->route('users.index')->with('success', $message);
    }

    public function edit(User $user)
    {
        $user->load(['roles','userGroup']); // Load roles and group relationships
   
        $roles = Role::all();
        $groups = Group::all();
        
        return Inertia::render('Users/Form', [
            'user' => $user,
            'roles' => $roles,
            'groups' => $groups,
            'alertTimer' => config('app.alert_timer'),
        ]);
    }

    public function update(UserRequest $request, User $user)
    {
        Log::info('UPDATE DATA', $request->all());

        $validated = $request->validated();
        if ($request->hasFile('photo')) {
            $validated['photo'] = $request->file('photo')->store('photos', 'public');
        }
        
        if ($validated['password']) {
            $validated['password'] = Hash::make($validated['password']);
        } else {
            unset($validated['password']);
        }

        $user->update($validated);
        $user->syncRoles([$validated['role']]); // Sync roles using Spatie

        $message = "{$user->name} is updated";
        return redirect()->route('users.index')->with('success', $message);
    }

    public function destroy(User $user)
    {
        $user->delete();
        $message = "{$user->name} is deleted";
        return redirect()->route('users.index')->with('success', $message);
    }

    public function enable(Request $request, User $user)
    {
        $user->is_active = true;
        $user->save();

        // Ambil filter & page dari request, lalu redirect dengan query string
        $query = $request->only(['name', 'email', 'page']);
        $message = "{$user->name} is set to enable";
        Log::info('ENABLE USER', ['id' => $user->id, 'query' => $query]);
        return redirect()->route('users.index', $query)->with('success',$message);
    }
    
    public function disable(Request $request, User $user)
    {
        $user->is_active = false;
        $user->save();
        
        $query = $request->only(['name', 'email', 'page']);
        Log::info('ENABLE USER', ['id' => $user->id, 'query' => $query]);
        $message = "{$user->name} is set to disable";
        return redirect()->route('users.index', $query)->with('success',$message);
    }
}
