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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('nickname')->nullable();
            $table->text('real_name')->nullable();
            $table->text('profile_picture_url')->nullable();
            $table->text('background_url')->nullable();
            $table->text('email');
            $table->text('password');
            $table->text('role');
            $table->text('bio')->nullable();
            $table->text('unique_code')->nullable();
            $table->bigInteger('country_id')->unsigned()->nullable();
            $table->foreign('country_id')->references('id')->on('countries');
            $table->bigInteger('wallet')->default(0);
            $table->bigInteger('point')->nullable();
            $table->rememberToken();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
};
