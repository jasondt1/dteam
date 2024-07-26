<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Publisher extends Model
{
    use HasFactory;

    public function games(){
        return $this->hasMany(Game::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }
}
