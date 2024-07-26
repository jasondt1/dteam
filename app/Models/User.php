<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;

class User extends Model implements AuthenticatableContract
{
    use HasFactory;
    use Authenticatable;

    public function country(){
        return $this->belongsTo(Country::class);
    }

    public function game_libraries()
    {
        return $this->belongsToMany(Game::class, 'game_libraries')->withPivot('discount_percentage')->withPivot('created_at');
    }

    public function item_libraries(){
        return $this->belongsToMany(Item::class, 'item_libraries');
    }

    public function game_carts(){
        return $this->belongsToMany(Game::class, 'game_carts')->withPivot('is_gift');
    }

    public function game_wishlists(){
        return $this->belongsToMany(Game::class, 'game_wishlists')->withPivot('created_at');
    }

    public function game_reviews(){
        return $this->hasMany(GameReview::class);
    }

    public function sent_gifts()
    {
        return $this->hasMany(GameGift::class, 'sender_id');
    }

    public function received_gifts(){
        return $this->hasMany(GameGift::class, 'receiver_id');
    }

    public function friends_with()
    {
        return $this->belongsToMany(User::class, 'friendlists', 'user_id_1', 'user_id_2');
    }

    public function friends_of()
    {
        return $this->belongsToMany(User::class, 'friendlists', 'user_id_2', 'user_id_1');
    }

    public function sent_friend_requests()
    {
        return $this->hasMany(FriendRequest::class, 'user_id_1');
    }

    public function received_friend_requests()
    {
        return $this->hasMany(FriendRequest::class, 'user_id_2');
    }

    public function wallet_code(){
        return $this->belongsTo(WalletCode::class);
    }

    public function publisher(){
        return $this->hasOne(Publisher::class);
    }

    public function get_role()
    {
        return $this->role;
    }
}
