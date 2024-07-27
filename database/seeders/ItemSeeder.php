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
            'name' => 'Neon Face',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/788100/8454554bc0a8bb82ac3991002fb71801b17596ff.gif',
            'price' => 1000
        ]);
        Item::create([
            'name' => 'Hellebore',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1574580/02a88fe40be3642793b1b574f378ef24e0372b8e.gif',
            'price' => 1000
        ]);
        Item::create([
            'name' => 'The Red Crown',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1313140/b5a0bd8b9bea4e1bd4773c9c3c0c8c1465b7340d.gif',
            'price' => 1000
        ]);
        Item::create([
            'name' => 'Doggie',
            'type' => 'avatar',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1476970/0f353f8171916feebeb7f2bc44acba6310b73ef0.gif',
            'price' => 1000
        ]);

        Item::create([
            'name' => 'Cat',
            'type' => 'background',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1332010/e7a8496874fe44a3c773c46ab1e8b886f71035e8.jpg',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'SHHHHH!',
            'type' => 'background',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/945360/380202f367adc87ef2900f1d96d7dfa4cbc413ab.jpg',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'Hero',
            'type' => 'background',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2161700/05ed1962c04f5fbbca0788664b81725a92e9273c.jpg',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'Mute',
            'type' => 'background',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/359550/8115fa76fc2e5759f041e9490aabfb636d1e6fad.jpg',
            'price' => 2000
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
        // Item::create([
        //     'name' => 'Mushroom',
        //     'type' => 'background',
        //     'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fmushroom.gif?alt=media&token=85ffdea6-704e-4baa-8628-c4d2ebc81332',
        //     'price' => 2000
        // ]);
        // Item::create([
        //     'name' => 'Bedroom Scene',
        //     'type' => 'background',
        //     'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fbedroom_scene.gif?alt=media&token=3c4bbb63-f321-447f-9c76-a4a2269f0f67',
        //     'price' => 2000
        // ]);
        Item::create([
            'name' => 'Glitch Sansui-Zu',
            'type' => 'background',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1465680/ee46cc3b6988057d435be7e391472d46f278d87a.jpg',
            'price' => 2000
        ]);
        Item::create([
            'name' => 'Hartman',
            'type' => 'background',
            'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fhartman.gif?alt=media&token=165e01f7-3fc8-440a-918d-7e23fce4e38f',
            'price' => 2000
        ]);
        // Item::create([
        //     'name' => 'Epiphyllums',
        //     'type' => 'background',
        //     'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fepiphyllums.gif?alt=media&token=f2b64dce-fe72-4375-8b92-11314e5e7a00',
        //     'price' => 2000
        // ]);
        Item::create([
            'name' => "Original Box Art",
            'type' => 'background',
            'image_url' => 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/275850/f9fd22144df3cffec574b31f14d44151551980c8.png',
            'price' => 2000
        ]);
        Item::create([
            'name' => "Rainy Day Greenhouse",
            'type' => 'background',
            'image_url' => 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Frainy_day_greenhouse.gif?alt=media&token=01f892e9-b6e0-440a-98cd-76d1c227d686',
            'price' => 2000
        ]);
    }
}
