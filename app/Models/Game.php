<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Game extends Model
{
    use HasFactory;

    public function age_rating(){
        return $this->belongsTo(AgeRating::class);
    }

    public function publisher(){
        return $this->belongsTo(Publisher::class);
    }

    public function game_carts(){
        return $this->belongsToMany(User::class, 'game_carts')->withPivot('is_gift');;
    }

    public function game_libraries(){
        return $this->belongsToMany(User::class, 'game_libraries');
    }

    public function game_wishlists(){
        return $this->belongsToMany(User::class, 'game_wishlists');
    }

    public function game_reviews(){
        return $this->hasMany(GameReview::class);
    }

    public function game_gifts(){
        return $this->hasMany(GameGift::class);
    }

    public function genres(){
        return $this->belongsToMany(Genre::class, 'game_genres');
    }

    public function game_images(){
        return $this->hasMany(GameImage::class);
    }

    public function getDiscountedPriceAttribute()
    {
        $discountedPrice = $this->price - ($this->price * ($this->discount_percentage / 100));
        return $discountedPrice;
    }
}
