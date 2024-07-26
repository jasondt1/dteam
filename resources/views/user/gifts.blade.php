@extends('layout')

@section('css', asset('css/gift.css'))

@section('content')
    <div class="container min-w-full">
        <div class="profile-top w-full -mt-8">
            <div class="profile-pic">
                <img src={{Auth::user()->profile_picture_url}}>
            </div>
            <div class="text-2xl font-light mb-1 text-white">{{Auth::user()->nickname}} <span class="text-xs mx-1 text-[#828282]">>></span> <span class="text-sm">Received Gifts</span></div>
        </div>
        <div class="friend mt-4 flex gap-6 flex-col md:flex-row">
            @php
            $pendingGiftsCount = Auth::user()->received_gifts->filter(function ($gift) {
                return $gift->status == 0;
            })->count();
            @endphp

            @if($pendingGiftsCount == 0)
                <p class="text-[#A9AFB4] mt-5 w-full text-center">There are no gifts to show.</p>
            @else
            <div class="content w-full">
                <div id="gifts" class="flex flex-col gap-4">
                    @foreach (Auth::user()->received_gifts as $gift)
                        @if($gift->status)
                            @continue
                        @endif
                        @php
                            $game = $gift->load('game')->game;
                            $sender = $gift->load('sender')->sender;
                        @endphp
                        <div class="">
                            <div class="flex items-center gap-2 bg-[#275C7D] p-3 justify-between">
                                <div class="flex gap-2">
                                    <p>You received a gift from </p>
                                    <div class="w-6 h-6"><img class="w-full h-full" src={{$sender->profile_picture_url}} alt=""></div>
                                    <p>{{$sender->nickname}}</p>
                                </div>
                                <a href={{ route('accept-gift', ['id'=>$gift->id]) }} class="uppercase green-btn text-xs py-1 px-5">Accept</a>
                            </div>
                            <div id={{ $game->id }} class="game-card p-3">
                                <a href="/game/details/{{$game->id}}" class="min-w-max min-h-max" style="z-index: 9999">
                                    <img src={{ $game->game_images[0]->image_url }} alt="">
                                </a>
                                <div class="flex flex-col gap-1">
                                    <p class="font-medium">{{ $game->title }}</p>
                                    <div class="">
                                        <div class="text-sm text-[#B9BCBF] uppercase font-semibold -mb-1">Received at </div>
                                        <span class="review-date text-[#809CA1] text-xs">{{$gift->created_at}}</span>
                                    </div>
                                    <div class="">
                                        <div class="text-sm text-[#B9BCBF] uppercase font-semibold -mb-1">Message</div>
                                        @if($gift->message)
                                        <span class="text-[#809CA1] text-xs">{{$gift->message}}</span>
                                        @else
                                        <span class="text-[#809CA1] text-xs">-</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            @endif
        </div>
    </div>
@endsection

