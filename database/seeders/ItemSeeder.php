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

        Item::create([
            'name' => 'Neener',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1097150/2fb8fd91cbdc6f8a3f630579a0ee479d5c22505f.gif',
            'price' => 1000
        ]);
        Item::create([
            'name' => 'Wave',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1097150/c33beb91c02f1a2c9b2d3e8d820d3f5be0b08b06.gif',
            'price' => 1000
        ]);
        Item::create([
            'name' => 'Gained Knowledge',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2055050/03e6938ae269d5fb3c83f6c56e1469b36171ad44.gif',
            'price' => 1000
        ]);
        Item::create([
            'name' => 'Broadened Horizons',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2055050/c59f1f3beafa934af92b51dcd0521298600239fb.gif',
            'price' => 1000
        ]);
        Item::create([
            'name' => 'Pollo',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2055500/9fa2a22c70382fcc6658728d23759d1fa36bd61f.gif',
            'price' => 100000
        ]);
        Item::create([
            'name' => 'Cat Face',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1529220/a8ba0e6ab807cd1f9dbe24f3958242e2d989e8c6.gif',
            'price' => 1000
        ]);
        Item::create([
            'name' => 'Ghost',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1658150/10280a18601f222faad9f1ff6ef0922e1fb446a5.gif',
            'price' => 1000
        ]);
        Item::create([
            'name' => 'Supply Depletion Koishi',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1684100/6ca57220d4dbb1fc7a6e620221f78328ed409db0.gif',
            'price' => 1000
        ]);

        Item::create([
            'name' => 'The World',
            'type' => 'background',
            'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fthe_world.gif?alt=media&token=a1dfc4e7-fbd6-44bd-a12e-7f754bbb09f1',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'Oko Background',
            'type' => 'background',
            'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Foko_background.gif?alt=media&token=13dcf4d2-4d83-4f78-9805-aee9dae59e1c',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'Spooky Mascots',
            'type' => 'background',
            'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fspooky_mascots.gif?alt=media&token=b04160fc-0e94-4148-aa50-e0f241085417',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'Animated Green Background',
            'type' => 'background',
            'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fanimated_green_background.gif?alt=media&token=54ced592-8956-4728-a2c9-338a17f72250',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'The Crossroads',
            'type' => 'background',
            'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fthe_crossroads.gif?alt=media&token=1be77948-d1d2-49b8-b0c6-d0605428134b',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'Bubble Blue',
            'type' => 'background',
            'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fbubble_blue.gif?alt=media&token=e1637127-b8f4-4a8b-8da3-a2aaab7bbf18',
            'price' => 2000
        ]);
    }
}
