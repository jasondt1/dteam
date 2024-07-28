@extends('layout')

@section('title', 'Wishlist - DTeam')
@section('css', asset('css/wishlist.css'))

@section('content')
    <div class="container min-w-full">
        @include('components.inner-navbar')
        <div class="wishlist-container mt-5">
            <div class="flex items-center gap-5">
                <div class="w-16 h-16">
                    <img class="w-full h-full" src="{{ Auth::user()->profile_picture_url }}" alt="">
                </div>
                <h1 class="uppercase text-3xl">{{ Auth::user()->nickname }}'s Wishlist</h1>
            </div>
            <div class="games-container flex flex-col gap-5 mt-5">
                @if(Auth::user()->game_wishlists->count() == 0)
                    <div class="text-center text-[#A9AFB4] mt-5">There are no games to show.</div>
                @else
                @foreach (Auth::user()->game_wishlists as $game)
                    <div id="game-{{ $game->id }}" class="game-card relative">
                        @if(Auth::user()->game_libraries->contains($game->id))
                        <div class="owned-decoration absolute top-10 left-0 py-0.5 px-1.5">
                            <div class="container flex gap-1">
                                <svg xmlns="http://www.w3.org/2000/svg" height="15px" viewBox="0 -960 960 960" width="15px" fill="#000000"><path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/></svg>
                                <p class="text-xs text-black">IN LIBRARY</p>
                            </div>
                        </div>
                        @endif
                        <a href="/game/details/{{ $game->id }}" class="w-full h-full md:w-96 md:h-36"><img class="w-full h-full" src="{{ $game->game_images[0]->image_url }}" alt=""></a>
                        <div class="game-card-content">
                            <a href="/game/details/{{ $game->id }}" style="text-shadow: 1px 1px #434343;" class="max-w-max font-medium text-xl">{{ $game->title }}</a>
                            <div class="content-mid">
                                <div class="mid-info text-xs">
                                    <div class="flex uppercase">
                                        <p style="text-shadow: 1px 1px #434343;" class="text-[#A9AFB4] w-28">Publisher:</p>
                                        <p onclick="navigate('{{ route('show-publisher', ['name' => $game->publisher->name]) }}')" style="text-shadow: 1px 1px #434343;" class="text-[#78B6E5] cursor-pointer hover:underline ">{{ $game->publisher->name }}</p>
                                    </div>
                                    <div class="flex uppercase">
                                        <p style="text-shadow: 1px 1px #434343;" class="text-[#A9AFB4] w-28">Released Date:</p>
                                        <p style="text-shadow: 1px 1px #434343;" class="released-date text-[#A9AFB4]">{{ $game->released_date }}</p>
                                    </div>
                                </div>
                                <div class="price-section bg-[#303D4B] p-1 min-h-max flex items-center gap-2">
                                    @if($game->price == 0)
                                    <p class="pl-2">Free to Play</p>
                                    @elseif($game->discount_percentage != 0)
                                    <div class="flex items-center">
                                        <p class="bg-[#4C6B22] text-[#BEEE11] py-[3.7px] px-1.5">{{$game->discount_percentage}}%</p>
                                        <div class="flex-col">
                                            <p class="price pl-2 line-through text-xs text-right text-[#738895]">{{ $game->price }}</p>
                                            <p class="price pl-2 -mt-[7px] text-right">{{ $game->discounted_price }}</p>
                                        </div>

                                    </div>
                                    @else
                                    <p class="price pl-2">{{ $game->price }}</p>
                                    @endif
                                    @if(Auth::user()->game_carts->contains($game->id))
                                    <a href="/cart/show" class="green-btn text-sm py-1.5 px-3 cursor-pointer">In Cart</a>
                                    @else
                                    <span class="green-btn text-sm py-1.5 px-3 cursor-pointer"
                                          onclick="showAddToCart({{ $game->id }}, '{{ $game->game_images[0]->image_url }}', '{{ addslashes($game->title) }}', '{{ $game->price }}', '{{Auth::user()->game_libraries->contains($game->id)}}', '{{$game->discount_percentage}}', '{{$game->discounted_price}}')">
                                      Add to Cart
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="genre-section flex flex-col text-xs">
                                <p class="w-28 label mb-0.5">GENRES:</p>
                                <div class="flex flex-col md:flex-row justify-between">
                                    <div class="flex gap-1">
                                        @foreach($game->genres as $genre)
                                            <p onclick="navigate('{{ route('search-game', ['genres' => [$genre->id]]) }}')" class="genre py-0.5 px-1.5">{{ $genre->name }}<p>
                                        @endforeach
                                    </div>
                                    <div class="flex gap-1 text-[#A9AFB4]">
                                        <span>Added on</span>
                                        <p class="added-date">{{ $game->pivot->created_at }}</p>
                                        <div class="flex gap-0.5"><span class="text-[10px]">(</span><span style="text-decoration: underline dotted #A9AFB4;" onclick="removeWishlist({{ $game->id }})" class="hover:text-white cursor-pointer">remove</span><span class="text-[10px]">)</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
                @endif
            </div>
        </div>
    </div>

    <div id="cartModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden text-white">
        <div class="bg-2 p-6 w-1/3 cart-modal">
            <h2 class="text-xl mb-6 font-bold">Added to your cart!</h2>
            <div class="flex flex-col cart-modal-container p-4">
                <div class="relative cart-modal-content">
                    <div class="owned-decoration absolute top-3 -left-2 py-0.5 px-1.5 hidden" id="owned" style="z-index:99999;">
                        <div class="container flex gap-1">
                            <svg xmlns="http://www.w3.org/2000/svg" height="15px" viewBox="0 -960 960 960" width="15px" fill="#000000"><path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/></svg>
                            <p class="text-xs text-black">IN LIBRARY</p>
                        </div>
                    </div>
                    <img id="modal-game-image" src="" alt="">
                    <div class="flex flex-col justify-between">
                        <p id="modal-game-title" class="font-medium"></p>
                        @if(Auth::user()->game_wishlists->count() != 0)
                        <select name="is_gift" id="gift" class="mr-auto mt-auto text-xs p-1 px-1.5 w-32 text-[#DFE3E6] cursor-pointer font-light" style="z-index: 99999;" onchange="updateGift()">
                            @if(!Auth::user()->game_libraries->contains($game->id))
                            <option value="0" {{ (Auth::user()->game_carts->contains($game->id) && Auth::user()->game_carts->find($game->id)->pivot->is_gift == 0) ? 'selected' : '' }}>For my account</option>
                            @endif
                            <option value="1" {{ (Auth::user()->game_carts->contains($game->id) && Auth::user()->game_carts->find($game->id)->pivot->is_gift == 1) ? 'selected' : '' }}>This is a gift</option>
                        </select>
                        @endif
                    </div>
                </div>
                <div class="cart-modal-right text-align-right w-full flex flex-col items-end gap-1 z-50">
                    <p id="modal-game-price" class="price text-sm text-[#969696] hidden"></p>
                    <div class="flex gap-1 hidden -mt-3 items-center" id="discount-game-price">
                        <p id="discount_percentage" class="h-full bg-[#4C6B22] p-[1px] px-1" style="color: #BEEE11;"></p>
                        <div class="flex flex-col">
                            <p class="price text-xs text-[#626366] line-through ml-auto" id="price"></p>
                            <p class="price text-sm text-[#969696] -mt-1" id="discounted_price"></p>
                        </div>
                    </div>
                    <span id="modal-remove-btn" class="text-xs text-[#606F7E] underline cursor-pointer hover:text-white" onclick="removeCart()">Remove</span>
                </div>
            </div>
            <div class="flex justify-end gap-4 mt-6 w-full">
                <button id="continue-btn" class="px-4 py-1 bg-gray-50 text-black rounded-sm hover:bg-gray-200 hover:text-gray-800 w-1/2 text-sm">Continue Shopping</button>
                <a href="/cart/show" id="view-cart-btn" class="blue-btn px-4 py-1.5 bg-red-600 rounded-sm w-1/2 text-sm text-center">View My Cart</a>
            </div>
        </div>
    </div>
    <script src="{{ asset('js/wishlist.js') }}"></script>
@endsection
