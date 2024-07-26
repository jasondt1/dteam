<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'email' => 'tanuartadjason@gmail.com',
            'password' => bcrypt('jasondt151'),
            'role' => 'publisher',
            'profile_picture_url' => 'https://avatars.akamai.steamstatic.com/af1cf9cf15be50bc6eda5a5c35bb1698bbf77ecd_full.jpg',
            'nickname' => 'jasondt'
        ]);
        User::create([
            'email' => 'jason@gmail.com',
            'password' => bcrypt('jasondt151'),
            'role' => 'admin'
        ]);
    }
}
