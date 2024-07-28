@extends('layout')

@section('title', $user->nickname .' - DTeam')
@section('css', asset('css/profile.css'))

@section('content')
<div class="container min-w-full">
    <div class="profile-container">
        <div class="profile-top w-full">
            <div class="flex flex-col sm:flex-row gap-7 w-max sm:w-2/3">
                <div class="profile-pic md:w-max aspect-square md:w-48 md:h-48">
                    <img class="w-full aspect-square" src="{{ $user->profile_picture_url }}">
                </div>

                <div class="profile-top-left-details text-[#BEBEBE] text-sm ml-2 md:ml-0">
                    <h1 class="text-3xl font-light mb-1 text-white">
                        @if (isset($user->nickname))
                        {{ $user->nickname }}
                        @else
                        Username
                        @endif
                    </h1>
                    <p class="mb-5">
                        @if (isset($user->real_name))
                        {{ $user->real_name }},
                        @else
                        Real Name
                        @endif
                        @if( isset($user->country_id) )
                        {{ $user->country->name }}
                        @endif
                      </p>
                    <p class="text-[13px]">
                        @if($user->bio)
                            {{ $user->bio }}
                        @else
                            There is no information given.
                        @endif
                    </p>
                </div>
            </div>
            <div class="profile-top-right w-max md:w-1/3 mt-1 pl-4 sm:pl-10">
                <div class="text-2xl flex items-center mb-2 font-light">Level <span class="circle aspect-square">{{ $user->game_libraries->count() }}</span></div>
                @if(Auth::user())
                    @if(Auth::user()->friends_with->contains($user->id) || Auth::user()->friends_of->contains($user->id))
                    <a href={{ route('remove-friend', ['id'=>$user->id]) }} class="profile-btn py-2 px-4">Remove Friend</a>
                    @elseif($user->unique_code == Auth::user()->unique_code)
                    <a href="{{ route('edit-profile-general') }}" class="profile-btn text-sm sm:text-base py-2 px-4 ">Edit Profile</a>
                    @elseif(Auth::user()->sent_friend_requests->contains('user_id_2', $user->id))
                    <a href={{ route('cancel-request', ['id'=>$user->id]) }} class="profile-btn py-2 px-4">Cancel Friend Request</a>
                    @elseif(Auth::user()->received_friend_requests->contains('user_id_1', $user->id))
                    <div class="flex flex-col md:flex-row gap-2">
                        <a href={{ route('accept-friend', ['id'=>$user->id]) }} class="profile-btn py-2 px-4">Accept Friend Request</a>
                        <a href={{ route('decline-friend', ['id'=>$user->id]) }} class="profile-btn py-2 px-2"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#FFFFFF"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg></a>
                    </div>
                    @else
                    <a href={{ route('add-friend', ['id'=>$user->id]) }} class="profile-btn py-2 px-4">Add Friend</a>
                    @endif
                @endif
            </div>
        </div>
        <div class="flex gap-5 flex-col md:flex-row px-8 md:px-0 mb-4">
            <div class="left w-full md:w-3/4 md:ml-4">
                <p class="recent">Recently Added</p>
                @if($user->game_libraries->count() == 0)
                <p class="w-full text-center mt-4">There is no recent purchase.</p>
                @endif
                @foreach ($user->game_libraries->sortKeysDesc()->take(3) as $game)
                <div id="{{ $game->id }}" class="game-card p-4 mt-5 relative">
                    <a href="/game/details/{{ $game->id }}" class="min-w-max min-h-max" style="z-index: 9999">
                        <img src="{{ $game->game_images[0]->image_url }}" alt="">
                    </a>
                    <p class="font-medium">{{ $game->title }}</p>
                    <div class="absolute bottom-2 right-3 text-sm text-[#969696]">Purchased at <span class="review-date">{{ $game->pivot->created_at }}</span></div>
                </div>
                @endforeach
            </div>
            <div class="right w-full md:w-1/3 mr-4 p-4">
                <p class="text-2xl text-[#8B8B8C] font-light">Currently Offline</p>
                <p class="text-lg text-[#8B8B8C]">Joined Since <span class="review-date">{{ $user->created_at }}</span></p>
                <div class="link mt-5 flex flex-col gap-4">
                    <div class="text-md"><a href={{ route('show-user-games', ['id'=>$user->unique_code]) }}>Games</a></div>
                    <div class="text-md"><a href={{ route('show-user-reviews', ['id'=>$user->unique_code]) }}>Reviews</a></div>
                    <div>
                        <a href={{ route('show-friends', ['id' => $user->unique_code]) }}>Friends</a>
                        @foreach ($friends as $friend)
                        @if($loop->index == 5)
                        @break
                        @endif
                        <div class="text-md">
                            <a style="text-decoration: none" href="{{ route('profile', ['id'=>$friend->unique_code]) }}">
                                <div class="flex justify-between items-center friend-card px-1.5 py-1 mt-1">
                                    <div class="flex gap-2">
                                        <img class="w-9 h-9 aspect-square friends-pic" src="{{ $friend->profile_picture_url }}" alt="">
                                        <div class="flex flex-col text-[11px] text-[#898989]">
                                            <p>{{$friend->nickname}}</p>
                                            <p class="-mt-1">Currently Offline</p>
                                        </div>
                                    </div>
                                    <p class="friend-circle">{{$friend->game_libraries->count()}}</p>
                                </div>
                            </a>
                        </div>
                        @endforeach
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.body.style.backgroundImage = "url('{{ $user->background_url }}')";
</script>
@endsection
