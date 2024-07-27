@extends('layout')

@section('title', 'DTeam :: ' . $game->title)
@section('css', asset('css/game-detail.css'))

@section('content')
@include('components.inner-navbar')
    <div class="flex flex-col gap-4 mt-5">
        <div class="game-header">
            <h1 class="text-3xl">{{$game->title}}</h1>
        </div>
        <div class="game-hero flex w-full gap-3 pb-2">
            <div class="hero-left w-3/4 flex flex-col gap-1">
                <div id="main-content" class="main-image crossfade-container">
                  <video autoplay controls muted id="video-top">
                    <source src="{{ $game->trailer_url }}" type="video/mp4">
                    Your browser does not support the video tag.
                  </video>
                </div>
                <div class="carousel-container flex overflow-x-scroll">
                    <div class="min-w-max relative">
                        <video class="img-bottom h-full selected-img" id="video-bottom" onclick="changeMainImage(this)">
                          <source src="{{ $game->trailer_url }}" type="video/mp4" >
                          Your browser does not support the video tag.
                        </video>
                        <span onclick="changeVideo()" class="video-play-button">▶</span>
                      </div>

                    @foreach ($game->game_images as $key => $image)
                        @if ($key > 0)
                            <img src="{{ $image->image_url }}" alt="" class="img-bottom" onclick="changeMainImage(this)">
                        @endif
                    @endforeach
                </div>
              </div>
            <div class="hero-right gap-2 w-2/5">
                <div class="">
                    <img src={{$game->game_images[0]->image_url}} alt="" class="right-image">
                </div>
                <div class="hero-right-desc">
                    <p class="desc mr-4">{{$game->brief_description}}</p>
                    <div class="hero-right-detail text-xs pr-2 mt-2 gap-1 flex flex-col">
                     <div class="flex gap-2">
                         <p class="w-28 label">RECENT REVIEWS:</p>
                         <div class="label-content flex gap-1
                         @if ($recentSentiment === 'Mostly Positive')
                             label-content
                         @elseif ($recentSentiment === 'Mixed')
                             text-yellow-300
                         @elseif ($recentSentiment === 'Mostly Negative')
                             text-red-500
                         @endif">
                         {{$recentSentiment}} <div class="label">(<span class="number">{{$recentReviews}}</span>)</div>
                     </div>
                     </div>
                         <div class="flex gap-2 mb-2">
                             <p class="w-28 label">ALL REVIEWS:</p>
                             <div class="label-content flex gap-1
                             @if ($totalSentiment === 'Mostly Positive')
                                 label-content
                             @elseif ($totalSentiment === 'Mixed')
                                 text-yellow-300
                             @elseif ($totalSentiment === 'Mostly Negative')
                                 text-red-500
                             @endif">{{$totalSentiment}} <div class="label">(<span class="number">{{$totalReviews}}</span>)</div></div>
                         </div>
                         <div class="flex gap-2 mb-2">
                             <p class="w-28 label">RELEASE DATE:</p>
                             <p class="label-date">{{$game->released_date}}</p>
                         </div>
                         <div class="flex gap-2 mb-2">
                             <p class="w-28 label">PUBLISHER:</p>
                             <p onclick="navigate('{{ route('show-publisher', ['name' => $game->publisher->name]) }}')" class="label-content cursor-pointer hover:underline">{{$game->publisher->name}}</p>
                         </div>
                         <div class="genre-section flex flex-col">
                             <p class="w-28 label mb-0.5">GENRES:</p>
                             <div class="flex gap-1">
                                 @foreach($game->genres as $genre)
                                     <p onclick="navigate('{{ route('search-game', ['genres' => [$genre->id]]) }}')"  class="genre py-0.5 px-1.5">{{$genre->name}}<p>
                                 @endforeach
                             </div>
                         </div>

                    </div>
                </div>
            </div>
        </div>
        @if(Auth::user() && Auth::user()->role == 'user')
        <div class="hero-bot">
            @if(Auth::user() && Auth::user()->game_wishlists->contains($game->id))
            <a class="wishlist-button genre py-2 px-5 rounded-sm" data-game-id="{{ $game->id }}" onclick="removeWishlist({{ $game->id }})">Remove from your wishlist</a>
        @else
            <a class="wishlist-button genre py-2 px-5 rounded-sm" data-game-id="{{ $game->id }}" onclick="addWishlist({{ $game->id }})">Add to your wishlist</a>
        @endif
        </div>
        @endif
        @if(Auth::user() && Auth::user()->game_libraries->contains($game->id))
        @if(Auth::user()->game_reviews->where('game_id', $game->id)->count() == 0)
        <div class="add-review-section relative">
            <div class="owned-decoration absolute mt-3.5 py-0.5 px-1.5">
                <div class="container flex gap-1">
                    <svg xmlns="http://www.w3.org/2000/svg" height="15px" viewBox="0 -960 960 960" width="15px" fill="#000000"><path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/></svg>
                    <p class="text-xs text-black">IN LIBRARY</p>
                </div>
            </div>
            <div class="game-owned w-full py-3 px-3 text-base pl-24">
                {{$game->title}} is already in your library
            </div>
            <div class="bottom-add-review p-5 pr-7 flex flex-col gap-1">
                <h1 class="label-content text-base">Write a review for {{$game->title}}</h1>
                <div class="container">
                    <p class="gray desc">Please describe what you liked or disliked about this game and whether you recommend it to others.</p>
                    <p class="gray desc">Please remember to be polite and follow the Rules and Guidelines.</p>
                </div>
                <div class="flex gap-5 mt-3">
                    <img src={{Auth::user()->profile_picture_url}} alt="" class="profile-pic">
                    <form class="container w-full" method="POST" action={{ route('data-review-add') }}>
                        @csrf
                        @if ($errors->any())
                            <div class="up">
                            @foreach($errors->all() as $error)
                                <p class="text-red-500 text-xs">{{ $error }}</p>
                            @endforeach
                            </div>
                        @endif
                        <textarea name="review" class="w-full review-area"></textarea>
                        <p class="gray desc mb-1">Do you recommend this game?</p>
                        <div class="justify-between btn-container">
                            <div class="flex gap-2">
                                <span id="yesBtn" class="py-2 flex justify-center items-center cursor-pointer vote-btn px-3 rounded-sm flex gap-2"><svg xmlns="http://www.w3.org/2000/svg" height="18px" viewBox="0 -960 960 960" width="18px" fill="#7cbeef" style=""><path d="M720-120H280v-520l280-280 50 50q7 7 11.5 19t4.5 23v14l-44 174h258q32 0 56 24t24 56v80q0 7-2 15t-4 15L794-168q-9 20-30 34t-44 14Zm-360-80h360l120-280v-80H480l54-220-174 174v406Zm0-406v406-406Zm-80-34v80H160v360h120v80H80v-520h200Z"/></svg> Yes</span>
                                <span id="noBtn" class="py-2 flex justify-center items-center cursor-pointer vote-btn px-3 rounded-sm flex gap-2"><svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#7cbeef"><path d="M240-816h456v480L408-48l-32-22q-17-12-26-30.5t-5-38.5l1-5 38-192H120q-30 0-51-21t-21-51v-57q0-8 1.5-14.5T54-493l119-279q8-20 26.5-32t40.5-12Zm384 72H240L120-465v57h352l-49 243 201-201v-378Zm0 378v-378 378Zm72 30v-72h144v-336H696v-72h216v480H696Z"/></svg> No</span>
                                <input id="recommend" type="hidden" name="recommend" value="0">
                                <input type="hidden" value={{$game->id}} name="game_id">
                            </div>
                            <button type="submit" class="py-1.5 px-3 rounded flex gap-2 post-btn text-center flex items-center justify-center">Post Review</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        @else
        <div class="add-review-section relative">
            <div class="owned-decoration absolute mt-3.5 py-0.5 px-1.5">
                <div class="container flex gap-1">
                    <svg xmlns="http://www.w3.org/2000/svg" height="15px" viewBox="0 -960 960 960" width="15px" fill="#000000"><path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/></svg>
                    <p class="text-xs text-black">IN LIBRARY</p>
                </div>
            </div>
            <div class="game-owned w-full py-3 px-3 text-base pl-24">
                {{$game->title}} is already in your library
            </div>
            <div class="bottom-add-review p-5 pr-7 flex flex-col gap-1">
                @php
                    $review = Auth::user()->game_reviews->where('game_id', $game->id)->first();
                @endphp
                <h1 class="label-content text-base">You reviewed this game on <span class="review-date">{{$review->created_at}}</span></h1>
                <div class="flex flex-col gap-2 my-1">
                    <div class="flex items-center gap-2" style="background-color: rgba(0, 0, 0, 0.2)">
                        <img src={{$review->rating_type->image_url}} alt="">
                        @if($review->rating_type_id == 1)
                            <span>Recommended</span>
                        @endif
                        @if($review->rating_type_id == 2)
                        <span>Not Recommended</span>
                    @endif
                    </div>
                    <p class="label2 text-sm">{{$review->content}}</p>
                </div>
            </div>
        </div>
        @endif
        @endif
        <div class="detail-section gap-4">
            <div class="detail-left">
                <div class="buy-section w-full p-6 rounded-md mb-8 relative">
                    <h1 class="text-2xl">Buy {{$game->title}}</h1>
                    @if($game->price == 0)
                    @if(Auth::user() && Auth::user()->role != 'user')
                    <div class="cart-container flex gap-5 py-[3px] px-5 items-center">
                        Free to Play
                    </div>
                    @else
                    <div class="cart-container flex gap-5 py-[3px] px-3 pr-[3px] items-center">
                        <p class="text-sm">Free to Play</p>
                        @if(Auth::user() && Auth::user()->game_carts->contains($game->id))
                        <a href="/cart/show" id="inCart" class="green-btn text-sm py-1.5 px-3 cursor-pointer" >In Cart</a>
                        @else
                        @if(Auth::user() && Auth::user()->role == 'user')
                        <span id="addCartBtn" class="green-btn text-sm py-1.5 px-3 cursor-pointer" onclick="showAddToCart({{$game->id}})">Add to Cart</span>
                        @elseif(!Auth::user())
                        <span id="addCartBtn" class="green-btn text-sm py-1.5 px-3 cursor-pointer" onclick="navigate('/login')">Add to Cart</span>
                        @endif
                        @endif
                    </div>
                    @endif
                    @elseif($game->discount_percentage == 0)
                    @if(!Auth::user() || Auth::user()->role != 'user')
                    <div class="price cart-container flex gap-5 py-[3px] px-5 items-center">
                        {{$game->price}}
                    </div>
                    @else
                    <div class="cart-container flex gap-5 py-[3px] px-5 pr-[3px] items-center">
                        <p class="text-sm price">{{$game->price}}</p>
                        @if(Auth::user() && Auth::user()->game_carts->contains($game->id))
                        <a href="/cart/show" id="inCart" class="green-btn text-sm py-1.5 px-3 cursor-pointer" >In Cart</a>
                        @else
                        @if(Auth::user() && Auth::user()->role == 'user')
                        <span id="addCartBtn" class="green-btn text-sm py-1.5 px-3 cursor-pointer" onclick="showAddToCart({{$game->id}})">Add to Cart</span>
                        @elseif(!Auth::user())
                        <span id="addCartBtn" class="green-btn text-sm py-1.5 px-3 cursor-pointer" onclick="navigate('/login')">Add to Cart</span>
                        @endif
                        @endif
                    </div>
                    @endif
                    @else
                    <div class="cart-container flex gap-1 px-[3px] py-[3px] items-center">
                        <p class="h-full bg-[#4C6B22] p-[3.1px] px-2 text-lg font-semibold" style="color: #BEEE11;">{{$game->discount_percentage}}%</p>
                        <div class="bg-[#344654] pt-[2px] px-3 -ml-1">
                            <p class="text-right price text-[#738895] line-through text-[12px]">{{$game->price}}</p>
                            <p class="price text-[15px] -mt-2" style="color: #BEEE11;">{{$game->discounted_price}}</p>
                        </div>

                        @if(Auth::user() && Auth::user()->game_carts->contains($game->id))
                        <a href="/cart/show" id="inCart" class="green-btn text-sm py-1.5 px-3 cursor-pointer" >In Cart</a>
                        @else
                        @if(Auth::user() && Auth::user()->role == 'user')
                        <span id="addCartBtn" class="green-btn text-sm py-1.5 px-3 cursor-pointer" onclick="showAddToCart({{$game->id}})">Add to Cart</span>
                        @elseif(!Auth::user())
                        <span id="addCartBtn" class="green-btn text-sm py-1.5 px-3 cursor-pointer" onclick="navigate('/login')">Add to Cart</span>
                        @endif
                        @endif
                    </div>
                    @endif
                </div>
                <div class="detail-left-content">
                    <h1 class="text-2xl uppercase mb-2">About This Game</h1>
                    <div class="text-sm full-desc">{!! $game->full_description !!}</div>
                </div>
            </div>
            <div class="detail-right gap-2 flex flex-col">
                <div class="detail-right-content p-4 flex flex-col gap-3">
                    <div class="flex gap-3">
                        <div class="min-w-max">
                            <img width="100" height="75" src={{$game->age_rating->image_url}} alt=""></div>
                        <p class="text-xs">{{$game->age_rating->description}}</p>
                    </div>
                </div>
                <div class="detail-right-content p-4 flex flex-col gap-2 text-xs">
                    <div class="flex gap-2">
                        <p class="label">TITLE:</p>
                        <p class="label-date">{{$game->title}}</p>
                    </div>
                    <div class="flex gap-2">
                        <p class="label">GENRES:</p>
                        <div class="flex gap-1">
                            @foreach($game->genres as $genre)
                            <p onclick="navigate('{{ route('search-game', ['genres' => [$genre->id]]) }}')" class="hover:underline cursor-pointer label-content">{{$genre->name}}<p>
                         @endforeach
                        </div>
                    </div>
                    <div class="flex gap-2">
                        <p class="label">PUBLISHER:</p>
                        <p onclick="navigate('{{ route('show-publisher', ['name' => $game->publisher->name]) }}')" class="hover:underline cursor-pointer label-content">{{$game->publisher->name}}</p>
                    </div>
                    <div class="flex gap-2">
                        <p class="label">RELEASE DATE:</p>
                        <p class="label-date">{{$game->released_date}}</p>
                    </div>
                    <a target="_blank" href={{$game->publisher->website}} class="flex items-center gap-1 vote-btn cursor-pointer px-2 py-1">
                        Visit the publisher website
                        <span>
                            <img src="https://store.akamai.steamstatic.com/public/images/v5/ico_external_link.gif" alt="">
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="review-section">
            <hr class="mb-4">
            <h1 class="text-2xl uppercase mb-2">Customer Reviews</h1>
            <div class="review-header">
                <div class="flex flex-col mb-2 overall py-2 px-3 justify">
                    <p class="">Overall Reviews:</p>
                    <div class="label-content flex gap-1
                    @if ($totalSentiment === 'Mostly Positive')
                        label-content
                    @elseif ($totalSentiment === 'Mixed')
                        text-yellow-300
                    @elseif ($totalSentiment === 'Mostly Negative')
                        text-red-500
                    @endif">
                    <div class="review-flex">
                        {{$totalSentiment}}
                        <div class="label2 text-xs flex items-center ml-1">(<span class="number text-xs mr-1">{{$totalReviews}}</span> reviews)</div></div>
                    </div>

                </div>
                <div class="flex flex-col mb-2 recent py-2 px-3 justify">
                    <p class="">Recent Reviews:</p>
                    <div class="label-content flex gap-1
                    @if ($recentSentiment === 'Mostly Positive')
                        label-content
                    @elseif ($recentSentiment === 'Mixed')
                        text-yellow-300
                    @elseif ($recentSentiment === 'Mostly Negative')
                        text-red-500
                    @endif">
                    <div class="review-flex">
                        {{$recentSentiment}}
                        <div class="label2 text-xs flex items-center ml-1">(<span class="number text-xs mr-1">{{$recentReviews}}</span> reviews)</div></div>
                    </div>
                </div>
            </div>
            <div class="review-container flex flex-col gap-2 mt-1">
                @foreach($reviews as $review)
                <div class="review-card flex p-3">
                    <div class="review-card-left">
                        <div class="flex gap-2 reviewer-profile">
                            <div class="w-14 h-14 cursor-pointer" onclick="navigate('/profile/{{$review->user->unique_code}}')"><img class="profile-border w-full h-full" src={{$review->user->profile_picture_url}} alt=""></div>

                            <div class="flex flex-col -mt-1">
                                <p class="cursor-pointer" onclick="navigate('/profile/{{$review->user->unique_code}}')">{{$review->user->nickname}}</p>
                                <div class="text-xs"><span class="number">{{$review->user->game_libraries_count}}</span> products in account</div>
                                <div class="text-xs"><span class="number">{{$review->user->game_reviews_count}}</span> reviews</div>
                            </div>
                        </div>
                    </div>
                    <div class="review-card-right flex flex-col gap-2">
                        <div class="review-content-header flex items-center gap-2">
                            <img src={{$review->rating_type->image_url}} alt="">
                            @if($review->rating_type_id == 1)
                                <span>Recommended</span>
                            @endif
                            @if($review->rating_type_id == 2)
                            <span>Not Recommended</span>
                        @endif
                        </div>
                        <div class="text-xs label mt-1">POSTED: <span class="review-date">{{$review->created_at}}</span></div>
                        <p class="label2 text-sm">{{$review->content}}</p>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>

    <div id="cartModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden text-white">
        <div class="bg-2 p-6 w-1/3 cart-modal">
            <h2 class="text-xl mb-6 font-bold">Added to your cart!</h2>
            <div class="flex flex-col cart-modal-container p-4">
                <div class="relative cart-modal-content">
                    @if(Auth::user() && Auth::user()->game_libraries->contains($game->id))
                    <div class="owned-decoration absolute top-3 -left-2 py-0.5 px-1.5" style="z-index:99999;">
                        <div class="container flex gap-1">
                            <svg xmlns="http://www.w3.org/2000/svg" height="15px" viewBox="0 -960 960 960" width="15px" fill="#000000"><path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/></svg>
                            <p class="text-xs text-black">IN LIBRARY</p>
                        </div>
                    </div>
                    @endif
                    <img src={{$game->game_images[0]->image_url}} alt="">
                    <div class="flex flex-col justify-between">
                        <p class="font-medium">{{$game->title}}</p>
                        <select name="is_gift" id="gift-{{$game->id}}" class="mr-auto mt-auto text-xs p-1 px-1.5 w-32 text-[#DFE3E6] cursor-pointer font-light" style="z-index: 99999;" onchange="updateGift({{$game->id}})">
                            @if(Auth::user() && !Auth::user()->game_libraries->contains($game->id))
                            <option value="0" {{ Auth::user() && (Auth::user()->game_carts->contains($game->id) && Auth::user()->game_carts->find($game->id)->pivot->is_gift == 0) ? 'selected' : '' }}>For my account</option>
                            @endif
                            <option value="1" {{ Auth::user() && (Auth::user()->game_carts->contains($game->id) && Auth::user()->game_carts->find($game->id)->pivot->is_gift == 1) ? 'selected' : '' }}>This is a gift</option>
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
                        <p class="price text-xs text-[#626366] line-through ml-auto text-right">{{$game->price}}</p>
                        <p class="price text-sm text-[#969696] -mt-1 text-right ml-auto">{{$game->discounted_price}}</p>
                    </div>
                </div>
                @else
                <p class="price text-sm text-[#969696]">{{$game->price}}</p>
                @endif
                <span onclick="removeCart({{$game->id}})" class="text-xs text-[#606F7E] underline cursor-pointer hover:text-white">Remove</span></div>
            </div>

            <div class="flex justify-end gap-4 mt-6 w-full">
              <button id="continue-btn" class="px-4 py-1 bg-gray-50 text-black rounded-sm hover:bg-gray-200 hover:text-gray-800 w-1/2 text-sm">Continue Shopping</button>
              <a href="/cart/show" id="view-cart-btn" class="blue-btn px-4 py-1.5 bg-red-600 rounded-sm w-1/2 text-sm text-center">View My Cart</a>
            </div>
          </div>
    </div>
    <script src={{ asset('js/game-detail.js') }}></script>
@endsection
