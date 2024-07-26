<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder2 extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        function generateUniqueCode() {
            $characters = '0123456789';
            $codeLength = 10;
            $code = '';

            do {
                $code = '';
                for ($i = 0; $i < $codeLength; $i++) {
                    $code .= $characters[rand(0, strlen($characters) - 1)];
                }
            } while (User::where('unique_code', $code)->exists());

            return $code;
        }

        for ($i = 0; $i < 100; $i++) {
            User::create([
                'email' => 'user' . $i . '@example.com',
                'password' => Hash::make('password123'),
                'nickname' => 'user' . $i,
                'real_name' => 'User user' . $i,
                'country_id' => 1,
                'role' => 'user',
                'wallet' => 0,
                'point' => 0,
                'profile_picture_url' => 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/',
                'background_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac',
                'unique_code' => generateUniqueCode(),
            ]);
        }
    }
}
