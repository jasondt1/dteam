@extends('layout')

@section('title', 'Search Game - DTeam' )
@section('css', asset('css/search-game.css'))

@section('content')
    <div class="container min-w-full">
        @include('components.inner-navbar')
        <form class="mt-5 flex gap-4 w-[99%] flex-col-reverse md:flex-row" action={{ route('search-game') }} method="GET">
            @csrf
            <div class="left w-full md:w-3/4">
            <div class="w-full bg-[#101822] rounded-sm p-2 inner-search-form flex justify-between items-center flex-col md:flex-row gap-2">
                <div class="flex items-center w-full">
                    <input type="text" class="bg-[#223A4C] w-full md:w-[60%] outline-none" name="title" placeholder="Enter game title..." value={{$search}}>
                    <button type="submit">Search</button>
                </div>
                <div class="flex items-center gap-2 min-w-max">
                    <p class="text-[#4C6C8C] text-sm min-w-max">Sort By</p>
                    <select name="sort_by" id="sort_by">
                        <option value="popularity" {{ request()->sort_by == 'popularity' ? 'selected' : '' }}>Most Popular</option>
                        <option value="reviews" {{ request()->sort_by == 'reviews' ? 'selected' : '' }}>Most Reviewed</option>
                        <option value="name" {{ request()->sort_by == 'name' ? 'selected' : '' }}>Name</option>
                        <option value="release_date" {{ request()->sort_by == 'release_date' ? 'selected' : '' }}>Release Date</option>
                        <option value="lowest_price" {{ request()->sort_by == 'lowest_price' ? 'selected' : '' }}>Lowest Price</option>
                        <option value="highest_price" {{ request()->sort_by == 'highest_price' ? 'selected' : '' }}>Highest Price</option>
                    </select>
                </div>
            </div>
            <div class="game-container mt-2 flex flex-col gap-2">
                @if($games->count() == 0)
                    <div class="text-center text-[#A9AFB4] mt-2 text-sm">0 results match your search.</div>
                @endif
                @foreach ($games as $game)
                <a class="game-card flex gap-2 items-center pb-2 md:pb-0 md:pr-4 flex-col md:flex-row" href={{ route('game-detail', ['id'=>$game->id]) }}>
                    <div class="min-w-full h-auto md:min-w-32 md:h-14" style="margin-right: auto">
                        <img class="w-full h-full" src={{$game->game_images[0]->image_url}} alt="">
                    </div>
                    <p class="text-[#CAD5DF] text-sm py-1 md:truncate w-full md:w-60 ml-2 md:ml-0" style="margin-right: auto">{{$game->title}}</p>
                    <p class="search-date text-[#536B89] text-[12px] w-max md:w-20 pr-2 md:pr-0" style="margin-left:auto">{{$game->released_date}}</p>
                    <div class="w-20 flex gap-2 items-center pr-2 md:pr-0" style="margin-left:auto">
                        <div class="w-5 ml-auto md:ml-0" style="">
                            @if($game->rating == "Positive")
                            <img src='https://store.akamai.steamstatic.com/public/images/v6/user_reviews_positive.png' alt="">
                            @elseif($game->rating == "Mixed")
                            <img src='https://store.akamai.steamstatic.com/public/images/v6/user_reviews_mixed.png' alt="">
                            @elseif($game->rating == "Negative")
                            <img src='https://store.akamai.steamstatic.com/public/images/v6/user_reviews_negative.png' alt="">
                            @endif
                        </div>
                        @if($game->discount_percentage != 0)
                        <p style="margin-left:auto" class="bg-[#4C6B22] text-[#BEEE11] text-sm w-10 h-6 flex items-center justify-center">{{$game->discount_percentage}}%</p>
                        @endif
                    </div>
                    @if($game->price == 0)
                    <p class="text-[#CAD5DF] text-sm text-right w-32 pr-2 md:pr-0" style="margin-left:auto">Free to Play</p>
                    @else
                    @if ($game->discount_percentage != 0)
                    <div class="flex flex-col pr-2 md:pr-0" style="margin-left:auto">
                        @php
                            $price = $game->price;
                            $discount = $game->discount_percentage;
                            $price = $price - ($price * $discount / 100);
                        @endphp
                        <p class="price text-[#CAD5DF] text-xs text-right w-32 line-through">{{$game->price}}</p>
                        <p class="price text-[#BEEE11] text-sm text-right w-32">{{$price}}</p>
                    </div>
                    @else
                    <p class="price text-[#CAD5DF] text-sm text-right w-32 pr-2 md:pr-0" style="margin-left:auto">{{$game->price}}</p>
                    @endif
                    @endif
                </a>
                @endforeach
            </div>
            @if($games->hasMorePages())
            <div id="loadMore" data-next-page="{{ $games->currentPage() + 1 }}" style="display: none;"></div>
            <div class="loader m-auto mt-5"></div>
            @endif
            </div>
            <div class="right w-full md:w-1/4 ">
                <p class="bg-[#323E4C] text-[#CAD5DF] text-sm p-1 pl-2">Narrow by Price</p>
                <div class="slider-container border border-[#323E4C] p-1">
                    <div class="px-4">
                        <input type="range" name="max_price" id="priceSlider" class="slider w-full" min="0" max="585000" step="45000" value="{{ request()->max_price ?? 585000 }}">
                        <div class="price-display w-full flex justify-center border-b border-[#323E4C]">
                            @if(is_null(request()->max_price) || request()->max_price == 585000)
                            <div id="priceValue" class="text-[#A4BAC9] text-sm text-center pb-2">Any Price</div>
                            @elseif(request()->max_price == 0)
                            <div id="priceValue" class="text-[#A4BAC9] text-sm text-center pb-2">Free to Play</div>
                            @else
                            <div id="priceValue" class="text-[#A4BAC9] text-sm text-center pb-2">Under <span class="price">{{ request()->max_price }}</span></div>
                            @endif
                        </div>
                    </div>

                    <label for="special-offers" class="h-8 checkbox-container text-[#9FBBCB] mt-2 check">
                        <input type="checkbox" id="special-offers" name="special_offers" {{ request()->special_offers ? 'checked' : '' }}>
                        <span class="checkbox"></span>Special Offers
                    </label>
                    <label for="free-items" class="h-8 checkbox-container text-[#9FBBCB] check">
                        <input type="checkbox" id="free-items" name="hide_free" {{ request()->hide_free ? 'checked' : '' }}>
                        <span class="checkbox"></span>Hide free to play items
                    </label>
                </div>
                @if(Auth::user())
                <p class="bg-[#323E4C] text-[#CAD5DF] text-sm p-1 pl-2 mt-4">Narrow by preferences</p>
                <div class="slider-container border border-[#323E4C] p-1">
                    <label for="library-items" class="h-8 checkbox-container text-[#9FBBCB] check">
                        <input type="checkbox" id="library-items" name="hide_library" {{ request()->hide_library ? 'checked' : '' }}>
                        <span class="checkbox"></span>Hide items in my library
                    </label>
                    <label for="wishlist-items" class="h-8 checkbox-container text-[#9FBBCB] check">
                        <input type="checkbox" id="wishlist-items" name="hide_wishlist" {{ request()->hide_wishlist ? 'checked' : '' }}>
                        <span class="checkbox"></span>Hide items on my wishlist
                    </label>
                </div>
                @endif
                <p class="bg-[#323E4C] text-[#CAD5DF] text-sm p-1 pl-2 mt-4">Genres</p>
                <div class="slider-container border border-[#323E4C] p-1">
                    @foreach ($genres as $genre)
                    <label for="{{ $genre->id }}" class="h-8 checkbox-container text-[#9FBBCB] check">
                        <input type="checkbox" id="{{ $genre->id }}" name="genres[]" value="{{ $genre->id }}" {{ in_array($genre->id, request()->genres ?? []) ? 'checked' : '' }}>
                        <span class="checkbox"></span>{{ $genre->name }}
                    </label>
                @endforeach
                </div>
            </div>
        </form>
    </div>
    <script>
        const priceSlider = document.getElementById('priceSlider');
        const priceValue = document.getElementById('priceValue');

        priceSlider.addEventListener('input', function () {
            if(priceSlider.value == 0){
                priceValue.textContent = "Free to Play";
                return;
            }
            else if(priceSlider.value == 585000){
                priceValue.textContent = "Any Price";
                return;
            }
            let currentPrice = parseFloat(priceSlider.value);
            value = parseInt(currentPrice, 10).toLocaleString("id-ID");
            rpValue = "Rp " + value;
            priceValue.textContent = "Under " + rpValue;
        });

        const checkboxes = document.querySelectorAll('.check input[type="checkbox"]');
        checkboxes.forEach((checkbox) => {
            const label = checkbox.parentElement;
            if (checkbox.checked) {
                    label.classList.add('active');
                    label.classList.add('text-white');
                } else {
                    label.classList.remove('active');
                    label.classList.remove('text-white');
                }
            checkbox.addEventListener('change', function() {
                this.form.submit();
            });
        });
        document.getElementById('sort_by').addEventListener('change', function(){
            this.form.submit();
        });

        priceSlider.addEventListener('input', function(){
            this.form.submit();
        });

        let currPage = 1;
        let loading = false;

        const currentUrl = window.location.href;
        const urlObj = new URL(currentUrl);
        const params = new URLSearchParams(urlObj.search);

        const token = params.get('_token');
        const title = params.get('title');
        const sort_by = params.get('sort_by');
        const max_price = params.get('max_price');
        const special_offers = params.get('special_offers');
        const hide_free = params.get('hide_free');
        const hide_library = params.get('hide_library');
        const hide_wishlist = params.get('hide_wishlist');
        const genres = params.getAll('genres[]');
        $('.loader').hide()

        let loadedGameIds = []

    document.querySelectorAll('.game-card').forEach(gameCard => {
        let id = gameCard.getAttribute('href').split('/').pop();
        id = parseInt(id, 10);
        loadedGameIds.push(id);
    });

    function loadMoreGames() {
        $('.loader').show();
        if (loading) return;
        loading = true;

        currPage++;
        let url = '{{ route("search-game") }}?page=' + currPage;
        if (token) url += '&_token=' + token;
        if (title) url += '&title=' + title;
        if (sort_by) url += '&sort_by=' + sort_by;
        if (max_price) url += '&max_price=' + max_price;
        if (special_offers) url += '&special_offers=' + special_offers;
        if (hide_free) url += '&hide_free=' + hide_free;
        if (hide_library) url += '&hide_library=' + hide_library;
        if (hide_wishlist) url += '&hide_wishlist=' + hide_wishlist;
        genres.forEach(genre => {
            url += '&genres[]=' + genre;
        });

            $.ajax({
                url: url,
                method: "GET",
                success: function (response) {
                    $('.loader').hide();
                    const gameContainer = document.querySelector('.game-container');

                    response.games.data.forEach(game => {
                        console.log(game.id)
                        if (loadedGameIds.includes(game.id)) return;
                        loadedGameIds.push(game.id);
                        const gameCard = document.createElement('a');
                        gameCard.classList.add('game-card', 'flex', 'gap-2', 'items-center', 'pb-2', 'md:pb-0', 'md:pr-4', 'flex-col', 'md:flex-row');
                        gameCard.href = '{{ route('game-detail', '') }}/' + game.id;

                        const imageContainer = document.createElement('div');
                        imageContainer.classList.add('min-w-full', 'h-auto', 'md:min-w-32', 'md:h-14');
                        const image = document.createElement('img');
                        image.src = game.game_images[0].image_url;
                        image.classList.add('w-full', 'h-full');
                        imageContainer.appendChild(image);
                        gameCard.appendChild(imageContainer);

                        const title = document.createElement('p');
                        title.classList.add('text-[#CAD5DF]', 'text-sm', 'py-1', 'md:truncate', 'w-full', 'md:w-60', 'ml-2', 'md:ml-0');
                        title.textContent = game.title;
                        gameCard.appendChild(title);

                        const date = document.createElement('p');
                        date.classList.add('search-date', 'text-[#536B89]', 'text-[12px]', 'w-max', 'md:w-20', 'pr-2', 'md:pr-0');
                        date.textContent = formatDated(game.released_date);
                        gameCard.appendChild(date);

                        const ratingContainer = document.createElement('div');
                        ratingContainer.classList.add('w-20', 'flex', 'gap-2', 'items-center', 'pr-2', 'md:pr-0');
                        const ratingImage = document.createElement('div');
                        ratingImage.classList.add('w-5', 'ml-auto', 'md:ml-0');
                        let ratingImageSrc = '';
                        if (game.rating === 'Positive') {
                            ratingImageSrc = 'https://store.akamai.steamstatic.com/public/images/v6/user_reviews_positive.png';
                        } else if (game.rating === 'Mixed') {
                            ratingImageSrc = 'https://store.akamai.steamstatic.com/public/images/v6/user_reviews_mixed.png';
                        } else if (game.rating === 'Negative') {
                            ratingImageSrc = 'https://store.akamai.steamstatic.com/public/images/v6/user_reviews_negative.png';
                        }
                        const ratingImageElement = document.createElement('img');
                        ratingImageElement.src = ratingImageSrc;
                        ratingImage.appendChild(ratingImageElement);
                        ratingContainer.appendChild(ratingImage);

                        if (game.discount_percentage !== 0) {
                            const discount = document.createElement('p');
                            discount.classList.add('bg-[#4C6B22]', 'text-[#BEEE11]', 'text-sm', 'w-10', 'h-6', 'flex', 'items-center', 'justify-center', 'ml-[11px]');
                            discount.textContent = game.discount_percentage + '%';
                            ratingContainer.appendChild(discount);
                        }
                        gameCard.appendChild(ratingContainer);

                        if (game.price === 0) {
                            const price = document.createElement('p');
                            price.classList.add('text-[#CAD5DF]', 'text-sm', 'text-right', 'w-32', 'pr-2', 'md:pr-0');
                            price.textContent = 'Free to Play';
                            gameCard.appendChild(price);
                        } else {
                            let currentPrice = parseFloat(game.price);
                            let value = parseInt(currentPrice, 10).toLocaleString("id-ID");
                            let formattedPrice = "Rp " + value;

                            if (game.discount_percentage !== 0) {
                                let discountedPrice = parseFloat(game.price - (game.price * game.discount_percentage / 100));
                                value = parseInt(discountedPrice, 10).toLocaleString("id-ID");
                                let formattedDiscountedPrice = "Rp " + value;
                                const priceContainer = document.createElement('div');
                                priceContainer.classList.add('flex', 'flex-col', 'pr-2', 'md:pr-0');
                                const price = document.createElement('p');
                                price.classList.add('price', 'text-[#CAD5DF]', 'text-xs', 'text-right', 'w-32', 'line-through');
                                price.textContent = formattedPrice;
                                priceContainer.appendChild(price);
                                const discountedPriceElement = document.createElement('p');
                                discountedPriceElement.classList.add('price', 'text-[#BEEE11]', 'text-sm', 'text-right', 'w-32');
                                discountedPriceElement.textContent = formattedDiscountedPrice;
                                priceContainer.appendChild(discountedPriceElement);
                                gameCard.appendChild(priceContainer);
                            } else {
                                const price = document.createElement('p');
                                price.classList.add('price', 'text-[#CAD5DF]', 'text-sm', 'text-right', 'w-32', 'pr-2', 'md:pr-0');
                                price.textContent = formattedPrice;
                                gameCard.appendChild(price);
                            }
                        }
                        gameContainer.appendChild(gameCard);
                    });

                    loading = false;
                    if (currPage >= response.games.last_page) {
                        document.getElementById('loadMore').style.display = 'none';
                        $('.loader').removeClass('loader');

                    } else {
                        document.getElementById('loadMore').setAttribute('data-next-page', currPage + 1);
                    }
                }
            });
        }

        function checkScroll() {
            if (window.innerHeight + window.scrollY >= document.body.scrollHeight - 50) {
                loadMoreGames();
            }
        }

        window.addEventListener('scroll', debounce(checkScroll, 200));

        function debounce(func, wait) {
            let timeout;
            return function(...args) {
                clearTimeout(timeout);
                timeout = setTimeout(() => func.apply(this, args), wait);
            };
        }

        function formatDated(timestamp) {
            const date = new Date(timestamp);
            const months = [
                "Jan",
                "Feb",
                "Mar",
                "Apr",
                "May",
                "Jun",
                "Jul",
                "Aug",
                "Sep",
                "Oct",
                "Nov",
                "Dec",
            ];

            const day = date.getDate();
            const month = months[date.getMonth()];
            const year = date.getFullYear();

            return `${day} ${month} ${year}`;
        }
    </script>
@endsection
