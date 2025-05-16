<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Http\Request;

class RolePermissionController extends Controller
{
    public function index()
    {
        return Inertia::render('Roles/Index', [
            'roles' => Role::with('permissions')->get(),
            'permissions' => Permission::all(),
        ]);
    }

    public function destroy(Role $role)
    {
        $role->delete();
        return redirect()->route('roles.index')->with('success', 'Role deleted successfully.');
    }    

    public function create()
    {
         return Inertia::render('Roles/PermissionMatrix', [
            'permissions' => Permission::all(),
        ]);
    }
    
    // Show the matrix for a specific role
    public function edit(Role $role)
    {
        $role->load('permissions');
        return Inertia::render('Roles/PermissionMatrix', [
            'role' => $role,
            'permissions' => Permission::all()
        ]);
    }
    
    //create a new record
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:roles,name',
            'permissions' => 'array',
            'permissions.*' => 'exists:permissions,name',
        ]);

        $role = Role::create(['name' => $request->name]);
        $role->syncPermissions($request->permissions ?? []);

        return redirect()->route('roles.index')->with('success', 'Role created successfully.');
    }

    //edit record
    public function update(Request $request, Role $role)
    {
        $request->validate([
            'permissions' => 'array',
            'permissions.*' => 'exists:permissions,name',
        ]);
        $role->syncPermissions($request->permissions ?? []);
        return redirect()->route('roles.index')->with('success', 'Permissions updated.');
    }

 
}