@extends('layout')

@section('css', asset('css/cart.css'))

@section('content')
    <div class="container min-w-full">
        @include('components.inner-navbar')
        <div class="cart-container mt-5">
            <h1 class="font-bold text-xl">Your Shopping Cart</h1>
            <div class="cart-section flex gap-5 flex-col md:flex-row">
                <div class="left w-full md:w-2/3">
                    @php
                        $totalPrice = 0;
                    @endphp

                    @foreach (Auth::user()->game_carts as $game)
                    <div id={{$game->id}} class="flex flex-col cart-modal-container p-4 mt-5 relative">
                        @if(Auth::user()->game_libraries->contains($game->id))
                        <div class="owned-decoration absolute top-7 left-0 py-0.5 px-1.5" style="z-index:99999;">
                            <div class="container flex gap-1">
                                <svg xmlns="http://www.w3.org/2000/svg" height="15px" viewBox="0 -960 960 960" width="15px" fill="#000000"><path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/></svg>
                                <p class="text-xs text-black">IN LIBRARY</p>
                            </div>
                        </div>
                        @endif
                        <div class="relative cart-modal-content flex gap-4 flex-col sm:flex-row">
                            <a href="/game/details/{{$game->id}}" class="min-w-max min-h-max" style="z-index: 9999">
                                <img src={{$game->game_images[0]->image_url}} alt="">
                            </a>
                            <div class="flex flex-col">
                                <p class="font-medium">{{$game->title}}</p>
                                <select name="is_gift" id="gift-{{$game->id}}" class="select mt-auto text-xs p-1 px-1.5 w-32 text-[#DFE3E6] cursor-pointer font-light" style="z-index: 99999;" onchange="updateGift({{$game->id}})">
                                    @if(!Auth::user()->game_libraries->contains($game->id))
                                    <option value="0" {{ $game->pivot->is_gift ? '' : 'selected' }}>For my account</option>
                                    @endif
                                    <option value="1" {{ $game->pivot->is_gift ? 'selected' : '' }}>This is a gift</option>
                                </select>
                            </div>
                        </div>
                        <div class="cart-modal-right text-align-right w-full flex flex-col items-end gap-1 z-50">
                            @if($game->price == 0)
                            <p class="text-sm text-[#969696]">Free to Play</p>
                            @elseif ($game->discount_percentage != 0)
                            <div class="flex gap-1 -mt-3 items-center">
                                <p class="h-full bg-[#4C6B22] p-[1px] px-1" style="color: #BEEE11;">{{$game->discount_percentage}}%</p>
                                <div class="flex flex-col">
                                    <p class="price text-xs text-[#626366] line-through ml-auto">{{$game->price}}</p>
                                    <p class="price text-sm text-[#969696] -mt-1">{{$game->discounted_price}}</p>
                                </div>
                            </div>
                            @else
                            <p class="price text-sm text-[#969696]">{{$game->price}}</p>
                            @endif
                            <span onclick="removeCart({{$game->id}}, {{$game->discounted_price}})" class="text-xs text-[#606F7E] underline cursor-pointer hover:text-white">Remove</span>
                        </div>
                    </div>

                    @php
                        $totalPrice += $game->discounted_price;
                    @endphp
                    @endforeach
                    @if(Auth::user()->game_carts->count() != 0)
                    <div class="cart-bottom flex justify-between items-center mt-5">
                        <button id="continue-btn" class="px-6 py-1.5 bg-[#3D4450] text-white rounded-sm hover:bg-[#474D57] text-sm">Continue Shopping</button>
                        <a href="/game/data/cart/remove-all/" class="text-xs text-[#606F7E] underline cursor-pointer hover:text-white">Remove all items</a>
                    </div>
                    @else
                    <div class="mt-5">Cart is empty</div>
                    <button id="continue-btn" class="mt-5 px-6 py-1.5 bg-[#3D4450] text-white rounded-sm hover:bg-[#474D57] text-sm">Continue Shopping</button>
                    @endif
                </div>
                <div class="right w-full md:w-1/3">
                    <div class="flex flex-col cart-modal-container p-4 mt-5 gap-3">
                        <div class="flex justify-between items-center">
                            <h2 class="font-medium text-sm">Estimated total</h2>
                            <p id="total-price" class="font-bold price">{{ $totalPrice }}</p>
                        </div>
                        <p class="text-xs">Sales tax will be calculated during checkout where applicable</p>

                        <a href="/checkout/show" id="view-cart-btn" class="mt-2 blue-btn px-4 py-1.5 bg-red-600 rounded-sm w-full text-sm text-center">Continue</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src={{ asset('js/cart.js') }}></script>
@endsection
