@extends('layout')

@section('title', 'DTeam :: Games')
@section('css', asset('css/game.css'))

@section('content')
    <div class="container min-w-full -mt-8">
        <div class="profile-container">
            <div class="profile-top w-full">
                <div class="profile-pic">
                    <img src={{$user->profile_picture_url}}>
                </div>
                <div class="text-2xl font-light mb-1 text-white">{{$user->nickname}} <span class="text-xs mx-1 text-[#828282]">>></span> <span class="text-sm">Games</span></div>
            </div>
            <div class="tabination mx-4 mt-4">
                <div class="tab-left text-sm">
                    <a href={{ route('show-user-games', ['id'=>$user->unique_code]) }} class="active">
                        All Games
                        <span class="text-[13px]">(</span>{{$user->game_libraries->count()}}<span class="text-[13px]">)</span>
                    </a>
                    <a href={{ route('show-user-reviews', ['id'=>$user->unique_code]) }} class="not-active">
                        Reviews
                        <span class="text-[13px]">(</span>{{$user->game_reviews->count()}}<span class="text-[13px]">)</span>
                    </a>
                </div>
            </div>
            <div class="flex gap-5 flex-col md:flex-row">
                @if($user->game_libraries->count() == 0)
                    <p class="text-[#A9AFB4] mt-5 w-full m-auto text-center">There are no games to show.</p>
                @else
                <div class="left w-full ml-4 mr-4">
                    @foreach ($user->game_libraries->sortKeysDesc() as $game)
                    <div id={{ $game->id }} class="game-card p-3 mt-3">
                        <a href="/game/details/{{$game->id}}" class="min-w-max min-h-max" style="z-index: 9999">
                            <img src={{ $game->game_images[0]->image_url }} alt="">
                        </a>
                        <div class="flex flex-col gap-3">
                            <p class="font-medium">{{ $game->title }}</p>
                            <div class="">
                                <div class="text-sm text-[#B9BCBF] uppercase font-semibold -mb-1">Purchased at </div>
                                <span class="review-date text-[#809CA1] text-xs">{{$game->pivot->created_at}}</span>
                            </div>
                            <a href="/game/details/{{$game->id}}"><p class="store-btn uppercase text-sm">Store Page</p></a>
                        </div>
                    </div>
                    @endforeach
                </div>
                @endif
            </div>

        </div>
    </div>
    <script src={{ asset('js/cart.js') }}></script>
@endsection
