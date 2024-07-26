<?php

namespace Database\Seeders;

use App\Models\RatingType;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RatingTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        RatingType::create([
            'title' => 'Recommended',
            'image_url' => 'https://store.akamai.steamstatic.com/public/shared/images/userreviews/icon_thumbsUp_v6.png',
        ]);
        RatingType::create([
            'title' => 'Not Recommended',
            'image_url' => 'https://store.akamai.steamstatic.com/public/shared/images/userreviews/icon_thumbsDown.png?v=1',
        ]);
    }
}
