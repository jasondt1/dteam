<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;

    public function item_libraries(){
        return $this->belongsToMany(User::class, 'item_libraries');
    }
}
