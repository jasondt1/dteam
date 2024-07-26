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
        Schema::create('wallet_codes', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('code')->unique();
            $table->bigInteger('amount');
            $table->boolean('is_used')->default(false);
            $table->dateTime('used_at')->nullable();
            $table->bigInteger('user_id')->unsigned()->nullable();

            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('wallet_codes');
    }
};
