<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            UserSeeder::class,
            AgeRatingSeeder::class,
            RatingTypeSeeder::class,
            CountrySeeder::class,
            UserSeeder2::class
        ]);
    }
}
