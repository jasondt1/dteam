@extends('layout')

@section('css', asset('css/search-game.css'))

@section('content')
    <div class="container min-w-full -mt-1">
        <div class="flex justify-between flex-col md:flex-row gap-8">
            <div class="flex gap-4">
                <div class="w-20 h-20">
                    <img class="h-full w-full" src={{Auth::user()->publisher->image_url}} alt="">
                </div>
                <div class="flex flex-col gap-3">
                    <p class="text-3xl">{{Auth::user()->publisher->name}}</p>
                    <a class="underline" href={{Auth::user()->publisher->website}}>{{Auth::user()->publisher->website}}</a>
                </div>
            </div>
            <div class="mt-auto">
                <a href="/publisher/game/add-game" class="blue-btn px-6 py-2 mr-2">Add Game</a>
            </div>

        </div>
        <div class="mt-5 flex gap-4 w-[99%] flex-col-reverse md:flex-row">
            <div class="left w-full">
            <div class="game-container mt-2 flex flex-col gap-2">
                @if($games->count() == 0)
                    <div class="text-center text-[#A9AFB4] mt-2 text-sm">No results.</div>
                @endif
                @foreach ($games as $game)
                <div class="flex items-center bg-[#16202d] gap-4 flex-col md:flex-row w-full relative">
                <a class="game-card flex gap-2 items-center pb-2 md:pb-0 md:pr-4 flex-col md:flex-row w-full md:w-[87%]" href={{ route('game-detail', ['id'=>$game->id]) }}>
                    <div class="min-w-full h-auto md:min-w-32 md:h-14" style="margin-right: auto">
                        <img class="w-full h-full" src={{$game->game_images[0]->image_url}} alt="">
                    </div>
                    <p class="text-[#CAD5DF] text-sm py-1 md:truncate w-60 ml-2 md:ml-0" style="margin-right: auto">{{$game->title}}</p>
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
                <div class="bg-[#16202d] ml-auto mr-4" style="width: 10%"><a href="{{ route('view-edit', ['id'=>$game->id]) }}" class="absolute left-2 bottom-6 md:left-0 md:bottom-0 md:relative blue-btn h-8 w-16 flex items-center justify-center m-auto">Edit</a></div>
            </div>
                @endforeach
            </div>
            </div>
        </div>
    </div>
@endsection
