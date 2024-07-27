@extends('layout')

@section('title', 'DTeam :: Reviews')
@section('css', asset('css/game.css'))

@section('content')
    <div class="container min-w-full -mt-8">
        <div class="profile-container">
            <div class="profile-top w-full">
                <div class="profile-pic">
                    <img src={{$user->profile_picture_url}}>
                </div>
                <div class="text-2xl font-light mb-1 text-white">{{$user->nickname}} <span class="text-xs mx-1 text-[#828282]">>></span> <span class="text-sm">Reviews</span></div>
            </div>
            <div class="tabination mx-4 mt-4">
                <div class="tab-left text-sm">
                    <a href={{ route('show-user-games', ['id'=>$user->unique_code]) }} class="not-active">
                        All Games
                        <span class="text-[13px]">(</span>{{$user->game_libraries->count()}}<span class="text-[13px]">)</span>
                    </a>
                    <a href={{ route('show-user-reviews', ['id'=>$user->unique_code]) }} class="active">
                        Reviews
                        <span class="text-[13px]">(</span>{{$user->game_reviews->count()}}<span class="text-[13px]">)</span>
                    </a>

                </div>
            </div>
            @if($user->game_reviews->count() == 0)
                <p class="text-[#A9AFB4] mt-5 w-full m-auto text-center">There are no reviews to show.</p>
            @else
            <p class="mx-4 text-xl my-4 recent-title py-2">Recent reviews by {{$user->nickname}}</p>
            <div class="flex gap-5 flex-col md:flex-row">
                <div class="left w-full md:w-2/3 ml-4 flex flex-col gap-4">
                    @foreach ($user->game_reviews->sortKeysDesc() as $review)
                    <div class="review-card p-3">
                        <a href="/game/details/{{$review->game->id}}" class="min-w-max min-h-max"><img src={{$review->game->game_images[0]->image_url}} alt=""></a>
                        <div class="flex flex-col w-full">
                            <div class="review-type flex items-center gap-2">
                                <img src={{$review->rating_type->image_url}} alt="">
                                @if($review->rating_type_id == 1)
                                    <span>Recommended</span>
                                @endif
                                @if($review->rating_type_id == 2)
                                <span>Not Recommended</span>
                            @endif
                            </div>
                            <p class="text-sm text-[#C0D4DE] mt-4">{{$review->content}}</p>
                            <div class="text-xs text-[#91989F]">Posted on <span class="review-date">{{$review->created_at}}</span></div>
                        </div>

                    </div>

                    @endforeach
                </div>
                <div class="right w-full md:w-1/3 mr-4 p-4">
                    <div class="flex gap-1 mb-3">
                        <p class="text-5xl">{{$user->game_reviews->count()}}</p>
                        <div class="">
                            <p class="uppercase text-xs text-[#969696]">Products</p>
                            <p class="uppercase text-xs text-[#969696]">Reviewed</p>
                        </div>

                    </div>
                    <div class="flex gap-1"><p class="text-5xl">{{$user->game_libraries->count()}}</p>
                        <div class="">
                            <p class="uppercase text-xs text-[#969696]">Products</p>
                            <p class="uppercase text-xs text-[#969696]">In Account</p>
                        </div>
                    </div>
                </div>
            </div>
            @endif
        </div>
    </div>
    <script src={{ asset('js/cart.js') }}></script>
@endsection
