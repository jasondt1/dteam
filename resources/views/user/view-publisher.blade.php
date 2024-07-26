@extends('layout')

@section('css', asset('css/search-game.css'))

@section('content')
    <div class="container min-w-full">
        @include('components.inner-navbar')
        <div class="mt-5 flex gap-4">
            <div class="w-20 h-20">
                <img class="h-full w-full" src={{$publisher->image_url}} alt="">
            </div>
            <div class="flex flex-col gap-3">
                <p class="text-3xl">{{$publisher->name}}</p>
                <a class="underline" href={{$publisher->website}}>{{$publisher->website}}</a>
            </div>

        </div>
        <div class="mt-5 flex gap-4 w-[99%] flex-col-reverse md:flex-row">
            <div class="left w-full">
            <div class="game-container mt-2 flex flex-col gap-2">
                @if($games->count() == 0)
                    <div class="text-center text-[#A9AFB4] mt-2 text-sm">No results.</div>
                @endif
                @foreach ($games as $game)
                <a class="game-card flex gap-2 items-center pb-2 md:pb-0 md:pr-4 flex-col md:flex-row" href={{ route('game-detail', ['id'=>$game->id]) }}>
                    <div class="min-w-full h-auto md:min-w-32 md:h-14" style="margin-right: auto">
                        <img class="w-full h-full" src={{$game->game_images[0]->image_url}} alt="">
                    </div>
                    <p class="text-[#CAD5DF] text-sm py-1 md:truncate w-full md:w-96 ml-2 md:ml-0" style="margin-right: auto">{{$game->title}}</p>
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
            </div>
        </div>
    </div>
@endsection
