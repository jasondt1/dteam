@extends('layout')

@section('css', asset('css/friend.css'))

@section('content')
    <div class="container min-w-full">
        <div class="friend-container -mt-8">
            <div class="title py-7 flex gap-6 items-center">
                <div class="w-16 h-16">
                    <a href={{ route('profile', ['id'=>$user->unique_code]) }}>
                        <img class="profile-border" src={{$user->profile_picture_url}} alt="">
                    </a>
                </div>
                <a href={{ route('profile', ['id'=>$user->unique_code]) }}>
                    <p class="text-2xl">{{$user->nickname}}</p>
                </a>
            </div>
        </div>
        <div class="friend mt-4 flex gap-6 flex-col md:flex-row">
            <div class="sidebar w-full md:w-1/4 text-[15px]">
                <p class="uppercase text-xs font-semibold pl-3 mb-0.5 text-[#7791A3]">Friends</p>
                <a href={{ route('show-friends', ['id'=>$user->unique_code]) }}>
                    <div class="py-2 flex justify-between items-center gap-5 font-light side-btn pl-3">
                        <div class="flex gap-5 items-center">
                            <svg class="-translate-x-[2px]" xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#FFFFFF"><path d="M480-480q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47ZM160-160v-112q0-34 17.5-62.5T224-378q62-31 126-46.5T480-440q66 0 130 15.5T736-378q29 15 46.5 43.5T800-272v112H160Zm80-80h480v-32q0-11-5.5-20T700-306q-54-27-109-40.5T480-360q-56 0-111 13.5T260-306q-9 5-14.5 14t-5.5 20v32Zm240-320q33 0 56.5-23.5T560-640q0-33-23.5-56.5T480-720q-33 0-56.5 23.5T400-640q0 33 23.5 56.5T480-560Zm0-80Zm0 400Z"/></svg>
                            <span class="mr-[1px]">{{$user->id == Auth::user()->id ? 'Your Friends' : 'All Friends'}}</span>
                        </div>
                        <span class="text-xs flex items-center justify-center w-4 h-4 rounded-sm mr-4">{{$user->friends_of->count() + $user->friends_with->count()}}</span>
                    </div>
                </a>
                @if($user->unique_code == Auth::user()->unique_code)
                    <a href={{ route('show-add-friend', ['id'=>$user->unique_code]) }}>
                        <div class="py-2 flex items-center gap-5 font-light side-btn pl-3"><svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#FFFFFF"><path d="M720-400v-120H600v-80h120v-120h80v120h120v80H800v120h-80Zm-360-80q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47ZM40-160v-112q0-34 17.5-62.5T104-378q62-31 126-46.5T360-440q66 0 130 15.5T616-378q29 15 46.5 43.5T680-272v112H40Zm80-80h480v-32q0-11-5.5-20T580-306q-54-27-109-40.5T360-360q-56 0-111 13.5T140-306q-9 5-14.5 14t-5.5 20v32Zm240-320q33 0 56.5-23.5T440-640q0-33-23.5-56.5T360-720q-33 0-56.5 23.5T280-640q0 33 23.5 56.5T360-560Zm0-80Zm0 400Z"/></svg>Add a Friend</div>
                    </a>
                    <a href={{ route('show-pending', ['id'=>$user->unique_code]) }}>
                        <div class="py-2 flex justify-between items-center gap-5 font-light side-btn pl-3 selected">
                            <div class="flex gap-5 items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" class="-ml-[1px]" fill="#FFFFFF"><path d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h640q33 0 56.5 23.5T880-720v480q0 33-23.5 56.5T800-160H160Zm320-280L160-640v400h640v-400L480-440Zm0-80 320-200H160l320 200ZM160-640v-80 480-400Z"/></svg>
                                <span class="mr-[1px]">Pending Invites</span>
                            </div>
                            @if(($user->received_friend_requests->count()) > 0)
                            <span class="text-xs flex items-center justify-center w-4 h-4 bg-[#ACCE41] text-black rounded-sm mr-4">{{$user->received_friend_requests->count()}}</span>
                            @endif
                        </div>
                    </a>
                @else
                <a href={{ route('mutual-friends', ['id'=>$user->unique_code]) }}>
                    <div class="py-2 flex justify-between items-center gap-5 font-light side-btn pl-3">
                        <div class="flex gap-5 items-center">
                            <svg class="-translate-x-[2px]" xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#FFFFFF"><path d="M96-192v-92q0-25.78 12.5-47.39T143-366q54-32 114.5-49T384-432q66 0 126.5 17T625-366q22 13 34.5 34.61T672-284v92H96Zm648 0v-92q0-42-19.5-78T672-421q39 8 75.5 21.5T817-366q22 13 34.5 34.67Q864-309.65 864-284v92H744ZM384-480q-60 0-102-42t-42-102q0-60 42-102t102-42q60 0 102 42t42 102q0 60-42 102t-102 42Zm336-144q0 60-42 102t-102 42q-8 0-15-.5t-15-2.5q25-29 39.5-64.5T600-624q0-41-14.5-76.5T546-765q8-2 15-2.5t15-.5q60 0 102 42t42 102ZM168-264h432v-20q0-6.47-3.03-11.76-3.02-5.3-7.97-8.24-47-27-99-41.5T384-360q-54 0-106 14t-99 42q-4.95 2.83-7.98 7.91-3.02 5.09-3.02 12V-264Zm216.21-288Q414-552 435-573.21t21-51Q456-654 434.79-675t-51-21Q354-696 333-674.79t-21 51Q312-594 333.21-573t51 21ZM384-264Zm0-360Z"/></svg>
                            <span class="mr-[1px]">Mutual Friends</span>
                        </div>
                        <span class="text-xs flex items-center justify-center w-4 h-4 rounded-sm mr-4">{{$user->mutual_friend_count}}</span>
                    </div>
                </a>
                @endif
                </div>
            <div class="content w-full md:w-3/4">
                <p class="uppercase bg-[#275C7D] p-3">Received Invites</p>
                <div id="requests" class="flex flex-col gap-1">
                    @if ($received->count() == 0)
                    <p id="emptyMessage" class="text-[#91989f] bg-[#18202C] p-3">There are no received friend invites to show.</p>
                @endif
                    @foreach($received as $request)
                        <div class="flex gap-5 bg-[#18202C] request-card px-5 py-3 items-center justify-between">
                            <div class="flex items-center gap-4">
                                <p class="friend-circle">{{$request->user_1->game_libraries->count()}}</p>
                                <div class="flex gap-4">
                                    <div class="w-9 h-9">
                                        <a href={{ route('profile', ['id'=>$request->user_1->unique_code]) }}>
                                            <img class="profile-border-2 w-full h-full" src="{{ $request->user_1->profile_picture_url }}" alt="">
                                        </a>
                                    </div>
                                    <div class="flex flex-col">
                                        <a href={{ route('profile', ['id'=>$request->user_1->unique_code]) }}>
                                            <p class="text-white font-semibold h-5 text-sm mt-0.5">{{ $request->user_1->nickname }}</p>
                                        </a>
                                        @if($request->mutualFriendsCount == 1)
                                        <p class="text-xs text-[#969696]">You have 1 friend in common</p>
                                        @elseif($request->mutualFriendsCount > 1)
                                        <p class="text-xs text-[#969696]">You have {{$request->mutualFriendsCount}} friends in common</p>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="flex gap-2">
                                <a href={{ route('accept-friend', ['id'=>$request->user_1->id]) }} class="text-sm btn py-1 px-8 rounded-sm">Accept</a>
                                <a href={{ route('decline-friend', ['id'=>$request->user_1->id]) }} class="text-sm btn py-1 px-8 rounded-sm">Ignore</a>
                            </div>
                        </div>
                    @endforeach
                </div>
                <p class="uppercase mt-5 bg-[#275C7D] p-3">Sent Invites</p>
                <div id="requests" class="flex flex-col gap-1">
                    @if ($sent->count() == 0)
                        <p id="emptyMessage" class="text-left text-[#91989f] bg-[#18202C] p-3">There are no sent friend invites to show.</p>
                    @endif
                    @foreach($sent as $request)
                        <div class="flex gap-5 bg-[#18202C] request-card px-5 py-3 items-center justify-between">
                            <div class="flex items-center gap-4">
                                <p class="friend-circle">{{$request->user_2->game_libraries->count()}}</p>
                                <div class="flex gap-4">
                                    <div class="w-9 h-9">
                                        <a href={{ route('profile', ['id'=>$request->user_2->unique_code]) }}>
                                            <img class="profile-border-2 w-full h-full" src="{{ $request->user_2->profile_picture_url }}" alt="">
                                        </a>
                                    </div>
                                    <div class="flex flex-col">
                                        <a href={{ route('profile', ['id'=>$request->user_2->unique_code]) }}>
                                            <p class="text-white font-semibold h-5 text-sm mt-0.5">{{ $request->user_2->nickname }}</p>
                                        </a>
                                        @if($request->mutualFriendsCount == 1)
                                        <p class="text-xs text-[#969696]">You have 1 friend in common</p>
                                        @elseif($request->mutualFriendsCount > 1)
                                        <p class="text-xs text-[#969696]">You have {{$request->mutualFriendsCount}} friends in common</p>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="flex gap-2">
                                <a href={{ route('cancel-request', ['id'=>$request->user_2->id]) }} class="text-sm btn py-1 px-8 rounded-sm">Cancel</a>
                            </div>
                        </div>
                    </a>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection

