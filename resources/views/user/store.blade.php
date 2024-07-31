@extends('layout')

@section('title', 'Store - DTeam')
@section('css', asset('css/store.css'))

@section('content')
    <div class="container min-w-full">
        @include('components.inner-navbar')
        <div class="wishlist-container mt-5">
            <p class="uppercase">Featured and Recommended</p>

            <div class="relative overflow-hidden">
                <div id="popularGamesCarousel" class="carousel flex transition-transform duration-500">
                    @foreach($popularGames as $game)
                        <div class="carousel-item flex-shrink-0 w-full cursor-pointer">
                            <a href="/game/details/{{$game->id}}">
                                <div class="flex carousel-card gap-2 relative">
                                    <div class="carousel-left bg-black" style="min-width: 626px; min-height: 352px" data-trailer-url="{{$game->trailer_url}}" data-img-url="{{$game->game_images[0]->image_url}}">
                                        <img src="{{$game->game_images[0]->image_url}}" alt="" class="carousel-main-img">
                                    </div>
                                    <div class="carousel-right">
                                        <p class="text-2xl p-2 py-4 truncate max-w-80">{{$game->title}}</p>
                                        <div class="game-images">
                                            @foreach ($game->game_images as $image)
                                                @if($loop->index > 0 && $loop->index < 5)
                                                    <img src="{{$image->image_url}}" alt="" class="carousel-side-img">
                                                @endif
                                            @endforeach
                                        </div>
                                        <p class="text-xl px-2 pt-4 pb-2">Now Available</p>
                                        <div class="flex gap-[2px] ml-[3px]">
                                            @foreach ($game->genres as $genre)
                                            <p class="text-xs py-0.5 px-1.5 bg-gray-500 max-w-max ml-1.5 rounded-sm">{{$genre->name}}</p>
                                        @endforeach
                                        </div>
                                        <div class="flex">
                                            @php
                                            $price = $game->price;
                                            $discount = $game->discount_percentage;
                                            $price = $price - ($price * $discount / 100);
                                            @endphp
                                            @if($game->discount_percentage != 0)
                                            <div class="flex">
                                                <p class="text-sm ml-2 mr-0.5 mt-3 bg-[#4C6B22] text-[#BEEE11] px-2">{{$game->discount_percentage}}%</p>
                                                <p class="text-sm price px-0.5 pt-3 line-through">{{$game->price}}</p>
                                                <p class="text-sm price px-0.5 pt-3 text-[#BEEE11]">{{$price}}</p>
                                            </div>
                                            @else
                                                @if($game->price == 0)
                                                    <p class="text-sm px-2 pt-3">Free To Play</p>
                                                @else
                                                    <p class="text-sm price px-2 pt-3">{{$game->price}}</p>
                                                @endif
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    @endforeach
                </div>
                <button id="prevButton" class="absolute top-1/2 left-0 transform -translate-y-1/2 bg-gray-800 bg-opacity-50 text-white px-3 py-6" onclick="prevSlide()">&#10094;</button>
                <button id="nextButton" class="absolute top-1/2 right-0 transform -translate-y-1/2 bg-gray-800 bg-opacity-50 text-white px-3 py-6" onclick="nextSlide()">&#10095;</button>
            </div>

            <div class="discount-section mt-10 p-5 relative rounded">
                <div class="flex justify-between items-center">
                    <p class="text-3xl font-bold text-[#E2535B] mb-1">Featured Deep Discounts</p>
                    <p onclick="navigate('{{ route('search-game', ['special_offers' => 'on']) }}')" class="cursor-pointer text-sm text-black bg-white px-3 py-0.5 font-semibold uppercase">See All</p>
                </div>

                <p class="mb-4 text-sm text-black">Especially great deals on some of the all-time greats</p>
                <div class="overflow-hidden">
                    <div id="discountGamesCarousel" class="carousel flex transition-opacity duration-500">
                        @foreach($discountedGames as $game)
                            <div class="discount-item flex-shrink-0 cursor-pointer relative">
                                <a class="min-w-full" href="/game/details/{{$game->id}}">
                                    <div class="carousel-card min-w-full relative">
                                        <div class="min-w-full carousel-left bg-black" data-trailer-url="{{$game->trailer_url}}" data-img-url="{{$game->game_images[0]->image_url}}">
                                            <img src="{{$game->game_images[0]->image_url}}" alt="" class="carousel-main-img min-w-full">
                                        </div>
                                        <div class="max-w-full text-center flex justify-center items-center gap-2 absolute bottom-0 right-0 bg-black pr-2 text-sm">
                                            <span class="py-0.5 font-bold bg-lime-400 px-2 text-black">-{{$game->discount_percentage}}%</span>
                                            @php
                                            $price = $game->price;
                                            $discount = $game->discount_percentage;
                                            $price = $price - ($price * $discount / 100);
                                            @endphp
                                            <p class="py-0.5 price line-through text-[#748995]">{{$game->price}}</p>
                                            <p class="price">{{$price}}
                                            </p></div>

                                    </div>
                                </a>
                            </div>
                        @endforeach
                    </div>
                    <button id="prevDiscountButton" class="absolute top-1/2 left-0 transform -translate-y-1/2 bg-gray-800 bg-opacity-50 text-white px-3 py-6 mt-9" onclick="prevDiscountSlide()">&#10094;</button>
                    <button id="nextDiscountButton" class="absolute top-1/2 right-0 transform -translate-y-1/2 bg-gray-800 bg-opacity-50 text-white px-3 py-6 mt-9" onclick="nextDiscountSlide()">&#10095;</button>
                </div>
            </div>
        </div>
    </div>
    <div id="cartModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden text-white">
        <div class="bg-2 p-6 w-1/3 cart-modal">
            <h2 class="text-xl mb-6 font-bold">Added to your cart!</h2>
            <div class="flex flex-col cart-modal-container p-4">
                <div class="relative cart-modal-content">
                    <img id="modal-game-image" src="" alt="">
                    <p id="modal-game-title" class="font-medium"></p>
                </div>
                <div class="cart-modal-right text-align-right w-full flex flex-col items-end gap-1 z-50">
                    <p id="modal-game-price" class="price text-sm text-[#969696]"></p>
                    <span id="modal-remove-btn" class="text-xs text-[#606F7E] underline cursor-pointer hover:text-white" onclick="removeCart()">Remove</span>
                </div>
            </div>
            <div class="flex justify-end gap-4 mt-6 w-full">
                <button id="continue-btn" class="px-4 py-1 bg-gray-50 text-black rounded-sm hover:bg-gray-200 hover:text-gray-800 w-1/2 text-sm">Continue Shopping</button>
                <a href="/cart/show" id="view-cart-btn" class="blue-btn px-4 py-1.5 bg-red-600 rounded-sm w-1/2 text-sm text-center">View My Cart</a>
            </div>
        </div>
    </div>

    <script>
    let currentIndex = 0;
    let discountIndex = 0;
    const intervalDuration = 3000;
    let slideInterval;

    function showSlide(index) {
        const carousel = document.getElementById('popularGamesCarousel');
        const items = carousel.children;
        const totalItems = items.length;

        const prevButton = document.getElementById('prevButton');
        const nextButton = document.getElementById('nextButton');

        if (index >= totalItems) {
            currentIndex = 0;
        } else if (index < 0) {
            currentIndex = totalItems - 1;
        } else {
            currentIndex = index;
        }

        prevButton.disabled = currentIndex === 0;
        nextButton.disabled = currentIndex === totalItems - 1;

        const offset = -currentIndex * 100;
        carousel.style.transform = `translateX(${offset}%)`;
    }

    function nextSlide() {
        showSlide(currentIndex + 1);
        resetSlideInterval();
    }

    function prevSlide() {
        showSlide(currentIndex - 1);
        resetSlideInterval();
    }

    function startSlideInterval() {
        slideInterval = setInterval(nextSlide, intervalDuration);
    }

    function resetSlideInterval() {
        clearInterval(slideInterval);
        startSlideInterval();
    }

    showSlide(currentIndex);
    startSlideInterval();

    document.getElementById('popularGamesCarousel').addEventListener('mouseover', function() {
        clearInterval(slideInterval);
    });

    document.getElementById('popularGamesCarousel').addEventListener('mouseout', function() {
        startSlideInterval();
    });

        function showDiscountSlide(index) {
            const carousel = document.getElementById('discountGamesCarousel');
            const items = carousel.children;
            const totalItems = items.length - 3;

            const prevDiscountButton = document.getElementById('prevDiscountButton');
            const nextDiscountButton = document.getElementById('nextDiscountButton');

            if (index > totalItems + 1) {
                discountIndex = totalItems;
            } else if (index < 0) {
                discountIndex = 0;
            } else {
                discountIndex = index;
            }

            prevDiscountButton.disabled = discountIndex === 0;
            nextDiscountButton.disabled = discountIndex === totalItems;

            const offset = (-discountIndex * 100 / 3);
            carousel.style.opacity = '0';

            setTimeout(() => {
                carousel.style.transform = `translateX(${offset}%)`;
                carousel.style.opacity = '1';
            }, 175);
        }

        function nextDiscountSlide() {
            showDiscountSlide(discountIndex + 1);
        }

        function prevDiscountSlide() {
            showDiscountSlide(discountIndex - 1);
        }

        showDiscountSlide(discountIndex);

        document.querySelectorAll('.carousel-left').forEach(item => {
            item.addEventListener('mouseover', function() {
                const trailerUrl = this.getAttribute('data-trailer-url');
                let videoElement = this.querySelector('video');
                if (!videoElement) {
                    videoElement = document.createElement('video');
                    videoElement.src = trailerUrl;
                    videoElement.autoplay = true;
                    videoElement.loop = true;
                    videoElement.muted = true;
                    videoElement.classList.add('carousel-main-video');
                    videoElement.style.display = 'none';
                    this.appendChild(videoElement);

                    videoElement.addEventListener('canplay', function() {
                        const imgElement = item.querySelector('img');
                        if (imgElement) {
                            imgElement.style.display = 'none';
                        }
                        videoElement.style.display = 'block';
                        videoElement.style.animation = 'fadeIn 1s';
                        videoElement.play();

                    });
                } else {
                    videoElement.style.display = 'block';
                    videoElement.play();
                    const imgElement = this.querySelector('img');
                    if (imgElement) {
                        imgElement.style.display = 'none';
                    }
                }
            });

            item.addEventListener('mouseout', function() {
                const imgElement = this.querySelector('img');
                if (imgElement) {
                    imgElement.style.display = 'block';
                    imgElement.style.animation = 'fadeIn 1s';
                }
                const videoElement = this.querySelector('video');
                if (videoElement) {
                    videoElement.style.display = 'none';
                    videoElement.pause();
                }
            });
        });
    </script>
@endsection
