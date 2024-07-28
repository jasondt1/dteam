<?php

use App\Http\Controllers\CartController;
use App\Http\Controllers\FriendController;
use App\Http\Controllers\GameController;
use App\Http\Controllers\GenreController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\PublisherController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WalletCodeController;
use App\Http\Controllers\WishlistController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->route('store');
});

Route::get('/register', function () {
    return view('register');
})->middleware('guest');

Route::get('/login', function () {
    return view('login');
})->name('login')->middleware('guest');

Route::get('/forgot-password', function () {
    return view('forgot-password');
})->name('forgot-password')->middleware('guest');

Route::get('/reset-password', function () {
    return view('reset-password');
})->name('reset-password')->middleware('guest');

Route::get('/reset-otp', function () {
    return view('reset-otp');
})->name('reset-otp')->middleware('guest');

Route::post('check-forgot-password', [UserController::class, 'forgotPassword'])->name('check-forgot-password')->middleware('guest');

Route::get('/logout', function () {
    Auth::logout();
    session()->flush();
    return redirect('/store/show');
})->name('logout')->middleware('auth');

Route::prefix('admin')->middleware('admin')->group(function () {
    Route::prefix('publisher')->group(function () {
        Route::get('add-publisher', function () {
            return view('admin/publishers/add-publisher');
        });

        Route::get('manage-publisher', [PublisherController::class, 'getAll'])->name('manage-publisher');
        Route::post('data/add', [PublisherController::class, 'add'])->name('data-publisher-add');
        Route::get('add-success', [PublisherController::class, 'success'])->name('publisher-add-success');
    });


    Route::prefix('wallet')->group(function () {
        Route::get('add-wallet-code', function () {
            return view('admin/wallets/add-wallet-code');
        });

        Route::get('manage-wallet-code', [WalletCodeController::class, 'getAll'])->name('manage-wallet-code');
        Route::get('add-success', [WalletCodeController::class, 'success'])->name('wallet-add-success');
        Route::post('data/add', [WalletCodeController::class, 'add'])->name('data-wallet-add');
    });

    Route::prefix('genre')->group(function () {
        Route::get('add-genre', function () {
            return view('admin/genres/add-genre');
        });

        Route::get('manage-genre', [GenreController::class, 'getAll'])->name('manage-genre');
        Route::post('data/add', [GenreController::class, 'add'])->name('data-genre-add');
        Route::get('edit-genre/{id}', [GenreController::class, 'edit'])->name('edit-genre');
        Route::put('/update-genre/{id}', [GenreController::class, 'update'])->name('data-genre-update');
        Route::delete('delete-genre/{id}', [GenreController::class, 'destroy'])->name('data-genre-delete');
    });

    Route::prefix('wallet')->group(function () {
        Route::post('data/add', [WalletCodeController::class, 'add'])->name('data-wallet-add');
    });
});

Route::prefix('user')->group(function () {
    Route::post('register', [UserController::class, 'register'])->name('data-register');
    Route::post('login', [UserController::class, 'login'])->name('data-login');
    Route::put('change-password', [UserController::class, 'changePassword'])->name('data-change-password')->middleware('auth');;
    Route::get('purchase-history', [UserController::class, 'showHistory'])->name('purchase-history')->middleware('user');
    Route::get('verification', [UserController::class, 'showVerification'])->name('verification')->middleware('unverified');
    Route::post('verify', [UserController::class, 'verify'])->name('verify')->middleware('user')->middleware('unverified');
    Route::get('resend', [UserController::class, 'resend'])->name('resend')->middleware('user')->middleware('unverified');
});

Route::prefix('publisher')->middleware('publisher')->group(function () {
    Route::get('welcome', [PublisherController::class, 'welcome'])->name('publisher-welcome');
    Route::get('edit-profile', [PublisherController::class, 'edit'])->name('edit-publisher-profile');
    Route::get('change-password', function () {
        return view('publisher/profiles/change-publisher-password');
    })->name('change-publisher-password');
    Route::post('setup', [PublisherController::class, 'setup'])->name('data-publisher-setup');
    Route::put('update-profile/{id}', [PublisherController::class, 'update'])->name('data-publisher-update');
    Route::get('manage-game', [GameController::class, 'getAll'])->name('manage-game');

    Route::prefix('game')->group(function () {
        Route::get('add-game', [GameController::class, 'addPage'])->name('add-game');
        Route::post('data/add', [GameController::class, 'add'])->name('data-game-add');
        Route::get('edit/{id}', [GameController::class, 'viewEdit'])->name('view-edit');
        Route::post('data/update/{id}', [GameController::class, 'update'])->name('data-update-game');
    });
});

Route::get('game/details/{id}', [GameController::class, 'getDetail'])->name('game-detail');

Route::prefix('game')->middleware('user')->group(function () {
    Route::post('data/review/add', [ReviewController::class, 'add'])->name('data-review-add');
    Route::get('data/wishlist/add/{game_id}', [WishlistController::class, 'add'])->name('data-wishlist-add');
    Route::get('data/wishlist/remove/{game_id}', [WishlistController::class, 'remove'])->name('data-wishlist-remove');
    Route::get('data/cart/add/{game_id}', [CartController::class, 'add'])->name('data-cart-add');
    Route::get('data/cart/remove/{game_id}', [CartController::class, 'remove'])->name('data-cart-remove');
    Route::get('data/cart/remove-all', [CartController::class, 'removeAll'])->name('data-cart-remove-all');
    Route::post('data/checkout/', [CartController::class, 'checkout'])->name('data-checkout');
});

Route::prefix('cart')->middleware('user')->group(function () {
    Route::get('show', function () {
        return view('user/cart');
    });
    Route::get('update-gift/{game_id}/{is_gift}', [CartController::class, 'updateGift'])->name('update_gift');
});

Route::prefix('wishlist')->middleware('user')->group(function () {
    Route::get('show', function () {
        return view('user/wishlist');
    });
});

Route::prefix('publisher')->group(function () {
    Route::get('{name}', [PublisherController::class, 'showPublisher'])->name('show-publisher');
});

Route::prefix('store')->group(function () {
    Route::get('show', [GameController::class, 'viewStore'])->name('store');
});

Route::prefix('checkout')->middleware('user')->group(function () {
    Route::get('show', [CartController::class, 'showCheckout']);
});

Route::prefix('redeem')->middleware('user')->group(function () {
    Route::get('show', function () {
        return view('user/redeem');
    });
});

Route::prefix('gift')->middleware('user')->group(function () {
    Route::get('show', function () {
        return view('user/gifts');
    })->name('gift');
    Route::get('accept/{id}', [GameController::class, 'acceptGift'])->name('accept-gift');
});

Route::post('wallet-redeem', [WalletCodeController::class, 'redeem'])->name('wallet-redeem')->middleware('user');

Route::get('profile/{id}', [UserController::class, 'showProfile'])->name('profile')->middleware('user');

Route::prefix('profile')->middleware('user')->group(function () {
    Route::get('{id}', [UserController::class, 'showProfile'])->name('profile');
    Route::get('{id}/friends', [FriendController::class, 'show'])->name('show-friends');
    Route::get('{id}/friends/pending', [FriendController::class, 'showPending'])->name('show-pending');
    Route::get('{id}/friends/mutual', [FriendController::class, 'showMutualFriends'])->name('mutual-friends');
    Route::get('{id}/friends/add', [FriendController::class, 'showAddFriend'])->name('show-add-friend');
    Route::get('{id}/games', [GameController::class, 'showUserGames'])->name('show-user-games');
    Route::get('{id}/reviews', [ReviewController::class, 'showUserReviews'])->name('show-user-reviews');
    Route::get('{id}/friends/requests', [FriendController::class, 'showFriendRequests'])->name('show-friend-requests');
    Route::get('get/{id}', [FriendController::class, 'getUserByUniqueCode'])->name('get-by-unique-code');
});

Route::prefix('search')->group(function () {
    Route::get('users', [SearchController::class, 'searchUser'])->name('search-user');
    Route::get('game-async/{query}', [SearchController::class, 'searchGameAsync'])->name('search-game-async');
    Route::get('games', [SearchController::class, 'searchGame'])->name('search-game');
});

Route::get('setup-profile/', [UserController::class, 'setupProfile'])->name('setup-profile')->middleware('user');

Route::prefix('edit-profile')->middleware('user')->group(function () {
    Route::get('general', [UserController::class, 'editGeneral'])->name('edit-profile-general');
    Route::put('update-setup', [UserController::class, 'updateSetup'])->name('update-setup');
    Route::put('update-general', [UserController::class, 'updateGeneral'])->name('update-general');
    Route::put('update-avatar', [UserController::class, 'updateAvatar'])->name('update-avatar');
    Route::put('update-background', [UserController::class, 'updateBackground'])->name('update-background');
    Route::get('security', [UserController::class, 'editSecurity'])->name('edit-profile-security');
    Route::get('background', [UserController::class, 'editBackground'])->name('edit-profile-background');
    Route::get('avatar', [UserController::class, 'editAvatar'])->name('edit-profile-avatar');
});

Route::prefix('point')->middleware('user')->group(function () {
    Route::get('shop', [ItemController::class, 'viewShop'])->name('point-shop');
    Route::get('purchase/{id}', [ItemController::class, 'purchaseItem'])->name('purchase-item');
});

Route::prefix('friend')->middleware('user')->group(function () {
    Route::get('add/{id}', [FriendController::class, 'addFriend'])->name('add-friend');
    Route::get('decline/{id}', [FriendController::class, 'declineFriendRequest'])->name('decline-friend');
    Route::get('accept/{id}', [FriendController::class, 'acceptFriendRequest'])->name('accept-friend');
    Route::get('remove/{id}', [FriendController::class, 'removeFriend'])->name('remove-friend');
    Route::get('cancel/{id}', [FriendController::class, 'cancelRequest'])->name('cancel-request');
});
