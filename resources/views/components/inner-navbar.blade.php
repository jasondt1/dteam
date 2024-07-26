<div class="inner-navbar-container -mt-6">
    @if(!Auth::user())
        <div class="mt-2"></div>
    @endif
    <div class="wishlist-cart-section mb-1">
        <div class=""></div>
        @if(Auth::user() && Auth::user()->role == 'user')
        <div class="wishlist-cart-container">
            <a href="/wishlist/show" class="wishlist w-28">Wishlist
                @if(Auth::user())
                <div class="ml-[3px]">
                    <span class="text-[10px]">(</span><span id="wishlist-count">{{Auth::user()->game_wishlists->count()}}</span><span class="text-[10px]">)</span>
                </div>
                @endif
            </a>
            <a href="/cart/show" class="cart w-28">
                <svg class="mr-0.5" xmlns="http://www.w3.org/2000/svg" height="12px" viewBox="0 -960 960 960" width="12px" fill="#FFFFFF"><path d="M263.79-96Q234-96 213-117.21t-21-51Q192-198 213.21-219t51-21Q294-240 315-218.79t21 51Q336-138 314.79-117t-51 21Zm432 0Q666-96 645-117.21t-21-51Q624-198 645.21-219t51-21Q726-240 747-218.79t21 51Q768-138 746.79-117t-51 21ZM253-696l83 192h301l82-192H253Zm-31-72h570q14 0 20.5 11t1.5 23L702.63-476.14Q694-456 676.5-444T637-432H317l-42 72h493v72H276q-43 0-63.5-36.15-20.5-36.16.5-71.85l52-90-131-306H48v-72h133l41 96Zm114 264h301-301Z"/></svg> Cart
                @if(Auth::user())
                <div class="ml-[3px]"><span class="text-[10px]">(</span><span id="cart-count">{{Auth::user()->game_carts->count()}}</span><span class="text-[10px]">)</span></div>
                @endif
            </a>
        </div>
        @endif
    </div>
</div>

<div class="inner-navbar relative" id="inner-navbar">
    <div class="left">
        <a href="/store/show">Your Store</a>
        <div class="">
            <a id="category" class="cursor-pointer">Categories</a>
            <div class="w-full h-max absolute top-9 left-0 p-5 category-container" id="category-container" style="z-index: 999999999">
                @php
                    $genres = \App\Models\Genre::all();
                @endphp
                <div class="flex gap-8">
                    <div class="flex flex-col gap-3 border-r border-[#d8d8d845] pr-8">
                        <p class="text-[#2EBFFF] font-bold uppercase text-xs" style="text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4)">Special Section</p>
                        <div class="flex flex-col gap-3 text-[13px] text-[#D8D8D8]">
                            <p onclick="navigate('{{ route('search-game', ['special_offers' => 'on']) }}')" class="category-link">Special Offers</p>
                            <p onclick="navigate('{{ route('search-game', ['max_price' => 0]) }}')" class="category-link">Free to Play</p>
                            <p onclick="navigate('{{ route('search-game', ['sort_by' => 'popularity']) }}')"  class="category-link">Most Popular</p>
                            <p onclick="navigate('{{ route('search-game', ['sort_by' => 'reviews']) }}')"  class="category-link">Most Reviewed</p>
                            <p onclick="navigate('{{ route('search-game', ['sort_by' => 'release_date']) }}')"  class="category-link">New Releases</p>
                        </div>
                    </div>
                    <div class="flex flex-col gap-3 border-r border-[#d8d8d845] pr-8">
                        <p class="text-[#2EBFFF] font-bold uppercase text-xs" style="text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4)">Genres</p>
                        <div class="flex flex-col flex-wrap max-h-40 gap-x-10 gap-y-3 text-[13px] text-[#D8D8D8]">
                            @foreach($genres as $genre)
                            <p onclick="navigate('{{ route('search-game', ['genres' => [$genre->id]]) }}')" class="category-link">{{ $genre->name }}</p>
                        @endforeach
                        </div>
                    </div>
                    <div class="flex flex-col gap-3">
                        <p class="text-[#2EBFFF] font-bold uppercase text-xs" style="text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4)">Price</p>
                        <div class="flex flex-col flex-wrap max-h-40 gap-x-8 gap-y-3 text-[13px] text-[#D8D8D8]">
                            <p onclick="navigate('{{ route('search-game', ['max_price' => 60000]) }}')" class="category-link">Under Rp 60.000</p>
                            <p onclick="navigate('{{ route('search-game', ['max_price' => 120000]) }}')" class="category-link">Under Rp 120.000</p>
                            <p onclick="navigate('{{ route('search-game', ['max_price' => 180000]) }}')" class="category-link">Under Rp 180.000</p>
                            <p onclick="navigate('{{ route('search-game', ['max_price' => 240000]) }}')" class="category-link">Under Rp 240.000</p>
                            <p onclick="navigate('{{ route('search-game', ['max_price' => 360000]) }}')" class="category-link">Under Rp 360.000</p>
                            <p onclick="navigate('{{ route('search-game', ['max_price' => 480000]) }}')" class="category-link">Under Rp 480.000</p>
                            <p onclick="navigate('{{ route('search-game', ['max_price' => 600000]) }}')" class="category-link">Under Rp 600.000</p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        @if (Auth::user() && Auth::user()->role == 'user')
        <a href={{ route('point-shop') }}>Points Shop</a>
        @endif
    </div>
    <div class="right relative">
        <form class="search-form" action={{ route('search-game') }} method="GET">
            @csrf
            <div class="min-w-max min-h-max absolute shadow-inner top-[29px] right-1.5 result-container" style="z-index: 999; display: none;">
            </div>
            <input type="text" placeholder="Search.." id="search-field" name="title"></input>
            <button type="submit">
                <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#334A65"><path d="M765-144 526-383q-30 22-65.79 34.5-35.79 12.5-76.18 12.5Q284-336 214-406t-70-170q0-100 70-170t170-70q100 0 170 70t70 170.03q0 40.39-12.5 76.18Q599-464 577-434l239 239-51 51ZM384-408q70 0 119-49t49-119q0-70-49-119t-119-49q-70 0-119 49t-49 119q0 70 49 119t119 49Z"/></svg>
            </button>
        </form>
    </div>
</div>

<script>
   let hideCategoryTimeout;

function navigateTo(url) {
        window.location.href = url;
    }

    $("#category-container").hide()

    $("#category").mouseenter(function() {
        clearTimeout(hideCategoryTimeout);
        $("#category-container").stop(true, true).fadeIn(150);
    });

    $("#category-container").mouseleave(function() {
        hideCategoryTimeout = setTimeout(function() {
            $("#category-container").fadeOut(150);
        }, 100);
    });

    $("#category").mouseleave(function() {
        hideCategoryTimeout = setTimeout(function() {
            if (!$("#category-container").is(':hover')) {
                $("#category-container").fadeOut(150);
            }
        }, 100);
    });

    $("#category-container").mouseenter(function() {
        clearTimeout(hideCategoryTimeout);
    });

    $('#search-field').on('input', function(){
        let resultContainer = $('.result-container');
        if(this.value.length < 2){
            resultContainer.empty().fadeOut(150);
            return;
        }
        let query = this.value;


    });
</script>
