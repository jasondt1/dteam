@extends('layout')

@section('title', 'DTeam :: Checkout')
@section('css', asset('css/cart.css'))

@section('content')
    <div class="container min-w-full">
        @include('components.inner-navbar')
        <div class="cart-container mt-5">
            <h1 class="font-bold text-xl">Checkout</h1>
            @if (session('success'))
            <div class="text-white mb-3 mt-4 text-sm bg-[#5c7e0f] p-3 shadow-lg">
                <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">{{ session('success') }}</p>
            </div>
            @endif
            <div class="cart-section flex gap-5 flex-col md:flex-row">
                @php
                $totalPrice = 0;
                @endphp
                @if(Auth::user()->game_carts->count() != 0)
                <form class="left w-full md:w-2/3" id="checkout-form" action={{ route('data-checkout') }} method="POST">
                    @csrf
                    @foreach (Auth::user()->game_carts as $game)
                    <div id="friend-modal-{{$game->id}}" style="z-index: 9999999;" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden text-white">
                        <div class="bg-2 p-6 w-1/3 relative friend-modal">
                            <p class="absolute top-4 right-4 cursor-pointer" onclick="closeFriendModal({{$game->id}})"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg></p>
                            <h2 class="text-xl mb-6 font-bold">Select Gift Recipient</h2>
                            <div class="flex flex-col gap-2 friends-container p-1">
                                @php
                                $sortedFriends = $friends->sortByDesc(function($friend) use ($game) {
                                    if ($friend->game_wishlists->contains($game->id)) {
                                        return 2;
                                    } elseif ($friend->game_libraries->contains($game->id)) {
                                        return 0;
                                    } else {
                                        return 1;
                                    }
                                });
                                @endphp
                                @foreach ($sortedFriends as $friend)
                                @if($friend->game_libraries->contains($game->id))
                                <div class="disabled-card p-4 flex items-center gap-2 justify-between">
                                    <div class="flex items-center gap-2">
                                        <div class="w-9 h-9">
                                            <img class="w-full h-full pic" src={{$friend->profile_picture_url}} alt="">
                                        </div>
                                        <p class="text-[#A0A0A0]">{{$friend->nickname}}</p>
                                    </div>
                                    @if($friend->game_libraries->contains($game->id))
                                    <p class="text-[#92782D] text-sm">Already owns this item</p>
                                    @elseif($friend->game_wishlists->contains($game->id))
                                    <p class="text-[#1A9FFF] text-sm">On Wishlist</p>
                                    @endif
                                </div>
                                @else
                                <div class="cursor-pointer friend-card p-4 flex items-center gap-2 justify-between" onclick="setRecipient('{{$game->id}}', '{{$friend->nickname}}', '{{$friend->profile_picture_url}}', '{{$friend->id}}')">
                                    <div class="flex items-center gap-2">
                                        <div class="w-9 h-9">
                                            <img class="w-full h-full pic" src={{$friend->profile_picture_url}} alt="">
                                        </div>
                                        <p class="text-[#A0A0A0]">{{$friend->nickname}}</p>
                                    </div>
                                    @if($friend->game_libraries->contains($game->id))
                                    <p class="text-[yellow] text-sm font-light">Already owns this item</p>
                                    @elseif($friend->game_wishlists->contains($game->id))
                                    <p class="text-[#1A9FFF] text-sm">On Wishlist</p>
                                    @endif
                                </div>
                                @endif
                                @endforeach
                            </div>
                        </div>
                    </div>
                    <div id={{$game->id}} class="flex flex-col cart-modal-container p-4 mt-5 relative">
                        <div class="relative cart-modal-content flex gap-4 flex-col sm:flex-row">
                            <a href="/game/details/{{$game->id}}" class="min-w-max min-h-max" style="z-index: 9999">
                                <img src={{$game->game_images[0]->image_url}} alt="">
                            </a>
                            <div class="flex flex-col">
                                <p class="font-medium">{{$game->title}}</p>
                                <select name="is_gift" id="gift-{{$game->id}}" class="mt-auto text-xs p-1 px-1.5 w-32 text-[#DFE3E6] font-light" style="z-index: 99999;" onchange="updateGift({{$game->id}})" disabled>
                                    @if(!Auth::user()->game_libraries->contains($game->id))
                                    <option value="0" {{ $game->pivot->is_gift ? '' : 'selected' }}>For my account</option>
                                    @endif
                                    <option value="1" {{ $game->pivot->is_gift ? 'selected' : '' }}>This is a gift</option>
                                </select>
                            </div>
                        </div>
                        <div class="cart-modal-right text-align-right w-full flex flex-col items-end gap-1 z-50">
                            @if($game->price == 0)
                            <p class="text-sm text-[#969696] mt-5">Free to Play</p>
                            @elseif ($game->discount_percentage != 0)
                            <div class="flex gap-1 mt-2 items-center">
                                <p class="h-full bg-[#4C6B22] p-[1px] px-1" style="color: #BEEE11;">{{$game->discount_percentage}}%</p>
                                <div class="flex flex-col">
                                    <p class="price text-xs text-[#626366] line-through ml-auto">{{$game->price}}</p>
                                    <p class="price text-sm text-[#969696] -mt-1">{{$game->discounted_price}}</p>
                                </div>
                            </div>
                            @else
                            <p class="price text-sm text-[#969696] mt-5">{{$game->price}}</p>
                            @endif
                        </div>
                        <p id="gift-receipent-{{$game->id}}" onclick="selectRecipient({{$game->id}})" class="mt-3 blue-btn px-4 py-1.5 rounded-sm w-full text-sm text-center cursor-pointer" style="{{ $game->pivot->is_gift ? '' : 'display:none;' }}">Select gift recipient...</p>
                        <div class="text-sm text-[#C7D2DC] mt-4 border-t border-[#353A43] pt-4 hidden" id="recipient-{{$game->id}}">
                            <div class="flex flex-col gap-4">
                                <div class="flex gap-2 items-center">
                                    <p>Gift Recipient:</p>
                                    <div class="w-8 h-8">
                                        <img id="recipient-image-{{$game->id}}" class="w-full h-full pic border" src={{Auth::user()->profile_picture_url}} alt="">
                                    </div>
                                    <p id="recipient-name-{{$game->id}}">{{Auth::user()->nickname}}</p>
                                    <p class="underline cursor-pointer text-[#636F7D] text-xs hover:text-white" id="recipient-edit-{{$game->id}}" onclick="selectRecipient({{$game->id}})">Edit</p>
                                </div>
                                <div class="">
                                    <input type="hidden" id="recipient-id-{{$game->id}}" name="gift_recipient_id[{{$game->id}}]">
                                    <p class="mb-1">Gift Message:</p>
                                    <textarea name="gift_message[{{$game->id}}]" class="w-full bg-[#292F38] resize-none border border-[#161D26] rounded h-20 outline-none p-2"></textarea>
                                </div>
                                <div class="flex gap-2 items-center">
                                    <p>From:</p>
                                    <div class="w-8 h-8">
                                        <img class="w-full h-full pic border" src={{Auth::user()->profile_picture_url}} alt="">
                                    </div>
                                    <p>{{Auth::user()->nickname}}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    @php
                        $totalPrice += $game->discounted_price;
                    @endphp
                    @endforeach
                </form>
                @else
                <a href="/store/show" class="mt-5 px-6 py-1.5 bg-[#3D4450] text-white rounded-sm hover:bg-[#474D57] text-sm">Continue Shopping</a>
                @endif
                @if(Auth::user()->game_carts->count() != 0)
                <div class="right w-full md:w-1/3 mt-5">
                    <p class="py-1 px-2 bg-[#303742] text-[#CAD5D5] text-sm">Purchase Details</p>
                    <div class="flex flex-col cart-modal-container p-4 gap-3">
                        <div class="flex justify-between items-center">
                            <h2 class="font-medium text-sm">Wallet Balance</h2>
                            <p class="font-bold price">{{ Auth::user()->wallet }}</p>
                        </div>
                        <div class="flex justify-between items-center">
                            <h2 class="font-medium text-sm">Total Price</h2>
                            <p id="total-price" class="font-bold price">{{ $totalPrice }}</p>
                        </div>
                        <p id="confirm-btn" class="mt-2 blue-btn px-4 py-1.5 rounded-sm w-full text-sm text-center">Confirm</p>
                    </div>
                </div>
                @endif
            </div>
        </div>
    </div>
    <script src={{ asset('js/cart.js') }}></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            validateWalletBalance();
            validateGiftRecipients();
        });

        function selectRecipient(gameId) {
            document.getElementById(`friend-modal-${gameId}`).classList.remove('hidden');
        }

        function closeFriendModal(gameId) {
            document.getElementById(`friend-modal-${gameId}`).classList.add('hidden');
        }

        function setRecipient(gameId, friendName, friendImage, friendId){
            document.getElementById(`recipient-name-${gameId}`).innerText = friendName;
            document.getElementById(`recipient-image-${gameId}`).src = friendImage;
            document.getElementById(`recipient-id-${gameId}`).value = friendId;
            closeFriendModal(gameId);
            document.getElementById(`recipient-${gameId}`).classList.remove('hidden');
            document.getElementById(`gift-receipent-${gameId}`).style.display = 'none';
            validateGiftRecipients();
        }

        function validateGiftRecipients() {
            let confirmButton = document.getElementById('confirm-btn');
            let gameCarts = @json(Auth::user()->game_carts);
            let allRecipientsSelected = true;

            gameCarts.forEach(game => {
                let isGift = game.pivot.is_gift;
                let recipientElement = document.getElementById(`recipient-${game.id}`);
                if (isGift && recipientElement.classList.contains('hidden')) {
                    allRecipientsSelected = false;
                }
            });

            if (!allRecipientsSelected) {
                confirmButton.classList.remove('blue-btn');
                confirmButton.classList.add('disable-btn');
                confirmButton.onclick = null;
            } else {
                validateWalletBalance();
            }
        }

        function validateWalletBalance() {
            let walletBalance = parseFloat({{ Auth::user()->wallet }});
            let totalPrice = parseFloat({{ $totalPrice }});
            let confirmButton = document.getElementById('confirm-btn');

            if (walletBalance < totalPrice) {
                confirmButton.classList.remove('blue-btn');
                confirmButton.classList.add('disable-btn');
                confirmButton.onclick = null;
                confirmButton.innerText = "Insufficient Wallet Balance";
            } else {
                confirmButton.classList.remove('disable-btn');
                confirmButton.classList.add('blue-btn');
                confirmButton.onclick = function() {
                    document.getElementById('checkout-form').submit();
                }
            }
        }
    </script>
@endsection
