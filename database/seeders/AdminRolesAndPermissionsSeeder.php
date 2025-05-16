<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\UserGroup;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;

class AdminRolesAndPermissionsSeeder extends Seeder
{
    public function run()
    {
        $adminRole = Role::firstOrCreate(['name' => 'admin']);
        
        $itGroup = UserGroup::firstOrCreate(['name' => 'IT']);
    
        $admin = User::firstOrCreate(
            ['email' => 'dedy.adhiewirawan@gmail.com'],
            [
                'name' => 'admin',
                'password' => Hash::make('admin'),
                'user_group_id' => $itGroup->id,
            ]
        );
    
        $admin->assignRole($adminRole);
    }
}
