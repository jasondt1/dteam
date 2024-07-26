<?php

namespace Database\Seeders;

use App\Models\Item;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ItemSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Item::create([
            'name' => 'Meow Mail',
            'type' => 'background',
            'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fmeow_mail.gif?alt=media&token=3f79d8e7-2267-469c-8e6d-5c45e547f9f7',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'Ashen Hush',
            'type' => 'background',
            'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fashen_hush.gif?alt=media&token=a877b90b-c8f8-4c19-b91a-c4e7b6311bb1',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'Gestu Clan Estate',
            'type' => 'background',
            'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fgestu_clan_estate.gif?alt=media&token=1ae819e7-d64e-4700-a3ef-d2a0c3be33a1',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'Cat Courier',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2855140/18201b6931880d3bcb863fc3f5f5d0f3889f5c68.gif',
            'price' => 1000
        ]);
        Item::create([
            'name' => 'Cicini',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/400910/8d405acf455855d778515064e91880c67fffff50.gif',
            'price' => 1000
        ]);
        Item::create([
            'name' => 'Rambus Play',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1944060/3c6e22e1856a08f4f1d7ee8dec21d7a28bb56eb2.gif',
            'price' => 1000
        ]);
    }
}
