<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FriendRequest extends Model
{
    use HasFactory;

    public function user_1()
    {
        return $this->belongsTo(User::class, 'user_id_1');
    }

    public function user_2()
    {
        return $this->belongsTo(User::class, 'user_id_2');
    }
}
