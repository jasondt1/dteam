<?php

namespace Database\Seeders;

use App\Models\AgeRating;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AgeRatingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        AgeRating::create([
            'title' => 'PEGI 3',
            'description' => 'The content of games with a PEGI 3 rating is considered suitable for all age groups. The game should not contain any sounds or pictures that are likely to frighten young children. A very mild form of violence (in a comical context or a childlike setting) is acceptable. No bad language should be heard.',
            'image_url' => 'https://pegi.info/sites/default/files/styles/medium/public/2017-03/2000px-PEGI_3.svg_.png',
        ]);
        AgeRating::create([
            'title' => 'PEGI 7',
            'description' => 'Game content with scenes or sounds that can possibly frightening to younger children should fall in this category. Very mild forms of violence (implied, non- pegi info detailed, or non-realistic violence) are acceptable for a game with a PEGI 7 rating.',
            'image_url' => 'https://pegi.info/sites/default/files/styles/medium/public/2017-03/pegi7.png',
        ]);
        AgeRating::create([
            'title' => 'PEGI 12',
            'description' => 'Video games that show violence of a slightly more graphic nature towards fantasy characters or non-realistic violence towards human-like characters would fall in this age category. Sexual innuendo or sexual posturing can be present, while any bad language in this category must be mild.',
            'image_url' => 'https://pegi.info/sites/default/files/styles/medium/public/2017-03/PEGI_12.png',
        ]);
        AgeRating::create([
            'title' => 'PEGI 16',
            'description' => 'This rating is applied once the depiction of violence or sexual activity reaches a stage that looks the same as would be expected in real life. The use of bad language in games with a PEGI 16 rating can be more extreme, while the use of tobacco, alcohol or illegal drugs can also be present.',
            'image_url' => 'https://pegi.info/sites/default/files/styles/medium/public/2017-03/pegi16.png',
        ]);
        AgeRating::create([
            'title' => 'PEGI 18',
            'description' => 'The adult classification is applied when the level of violence reaches a stage where it becomes a depiction of gross violence, apparently motiveless killing, or violence towards defenceless characters. The glamorisation of the use of illegal drugs and of the simulation of gambling, and explicit sexual activity should also fall into this age category.',
            'image_url' => 'https://pegi.info/sites/default/files/styles/medium/public/2017-03/pegi18.png',
        ]);
    }
}
