<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Friendlist extends Model
{
    use HasFactory;

    public function user_1(){
        return $this->belongsTo(User::class);
    }

    public function user_2(){
        return $this->belongsTo(User::class);
    }
}
