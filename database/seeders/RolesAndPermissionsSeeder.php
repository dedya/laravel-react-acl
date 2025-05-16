<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;

class RolesAndPermissionsSeeder extends Seeder
{
    public function run(): void
    {
        // Clear cache
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // Create permissions
        $permissions = [
            'view users',
            'create users',
            'edit users',
            'delete users',
        ];

        foreach ($permissions as $permission) {
            Permission::firstOrCreate(['name' => $permission]);
        }

        // Create roles and assign permissions
        $admin = Role::firstOrCreate(['name' => 'admin']);
        $admin->syncPermissions(Permission::all());

        $manager = Role::firstOrCreate(['name' => 'manager']);
        $manager->syncPermissions([
            'view users',
            'edit users',
        ]);

        Role::firstOrCreate(['name' => 'user']); // No permissions by default

        // Optional: Assign the "admin" role to the first user
        $user = User::first();
        if ($user && !$user->hasRole('admin')) {
            $user->assignRole('admin');
        }

        $this->command->info('Roles and permissions seeded successfully.');
    }
}
