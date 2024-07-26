<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('games', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('title');
            $table->text('trailer_url');
            $table->text('brief_description');
            $table->text('full_description');
            $table->date('released_date');
            $table->bigInteger('price');
            $table->bigInteger('discount_percentage');
            $table->bigInteger('publisher_id')->unsigned();
            $table->bigInteger('age_rating_id')->unsigned();

            $table->foreign('publisher_id')->references('id')->on('publishers');
            $table->foreign('age_rating_id')->references('id')->on('age_ratings');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('games');
    }
};
