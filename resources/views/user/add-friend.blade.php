@extends('layout')

@section('title', 'Add Friend - DTeam')
@section('css', asset('css/friend.css'))

@section('content')
    <div class="container min-w-full">
        <div class="friend-container -mt-8">
            <div class="title py-7 flex gap-6 items-center">
                <div class="w-16 h-16">
                    <a class="w-full h-full" href={{ route('profile', ['id'=>$user->unique_code]) }}>
                        <img class="profile-border w-full h-full" src={{$user->profile_picture_url}} alt="">
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
                <span class="hidden" id="curr-user-unique-code">{{Auth::user()->unique_code}}</span>
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
                        <div class="py-2 flex items-center gap-5 font-light side-btn pl-3 selected"><svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#FFFFFF"><path d="M720-400v-120H600v-80h120v-120h80v120h120v80H800v120h-80Zm-360-80q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47ZM40-160v-112q0-34 17.5-62.5T104-378q62-31 126-46.5T360-440q66 0 130 15.5T616-378q29 15 46.5 43.5T680-272v112H40Zm80-80h480v-32q0-11-5.5-20T580-306q-54-27-109-40.5T360-360q-56 0-111 13.5T140-306q-9 5-14.5 14t-5.5 20v32Zm240-320q33 0 56.5-23.5T440-640q0-33-23.5-56.5T360-720q-33 0-56.5 23.5T280-640q0 33 23.5 56.5T360-560Zm0-80Zm0 400Z"/></svg>Add a Friend</div>
                    </a>
                    <a href={{ route('show-pending', ['id'=>$user->unique_code]) }}>
                        <div class="py-2 flex justify-between items-center gap-5 font-light side-btn pl-3">
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
                <p class="uppercase bg-[#275C7D] p-3">Add a Friend</p>
                <div class="content bg-[#00000080] p-5">
                    <p class="mb-1">Your Friend Code</p>
                    <div class="bg-[#243543] p-3 flex justify-between items-center gap-2">
                        <span class="text-2xl md:text-3xl" id="unique_code">{{$user->unique_code}}</span>
                        <span class="block copy-btn cursor-pointer w-32 h-8 text-sm flex items-center justify-center uppercase">Copy</span>
                    </div>
                    <p class="text-[#91989F] text-sm mt-4">Enter your friend's Friend Code to invite them to connect.</p>
                    <form class="search-code mt-4" action="" id="prevent">
                        <div class="flex input-code-container gap-2 items-center mb-3 mt-1">
                            <input type="text" id="searchUniqueCode" placeholder="Enter a friend code">
                        </div>
                    </form>
                    <div id="result" class="bg-[#243543] p-4 flex-col gap-4 hidden">
                        <div class="flex justify-between gap-4 flex-col md:flex-row">
                            <div class="flex gap-4">
                                <div class="w-[5.5rem] h-[5.5rem]"><img class="w-full h-full" id="search_pic" src={{$user->profile_picture_url}} alt=""></div>
                                <div class="flex flex-col">
                                    <p id="search_nickname">{{$user->nickname}}</p>
                                    <a href="" id="search_link" class="text-[#54B6F9] text-sm">Profile Link</a>
                                    <p id="search_real_name" class="text-sm text-[#91989F]">{{$user->real_name}}</p>
                                    <p id="search_country" class="text-sm text-[#91989F]">{{$user->country->name}}</p>
                                </div>
                            </div>
                            <div class="flex items-center">
                                <span id="send-btn" class="block copy-btn cursor-pointer w-32 h-8 text-sm flex items-center justify-center hidden">Send Invite</span>
                                <span id="disabled-btn" class="cursor-default block disabled-btn w-32 h-8 text-sm flex items-center justify-center hidden">Send Invite</span>
                            </div>
                        </div>
                        <p id="message" class="mt-2 text-sm" ></p>
                        <a href="" class="text-[#54B6F9] text-sm block" id="search-mutual-link">You have <span id="search-mutual">125</span> mutual friends</a>
                    </div>
                </div>
                <div class="content bg-[#0000004d] p-5">
                    <p class="mb-1">Or try searching for your friend</p>
                    <form class="search-code mt-4" action={{ route('search-user') }}>
                        @csrf
                        <div class="flex input-code-container gap-2 items-center mb-3 mt-1">
                            <input type="text" id="nickname" name="nickname" placeholder="Enter your friend's profile name">
                            <button type="submit">
                                <svg class="cursor-pointer" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#FFFFFF"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
          const copyBtn = document.querySelector('.copy-btn');
          copyBtn.addEventListener('click', function() {
            const friendCodeInput = document.createElement('input');
            friendCodeInput.value = document.querySelector('#unique_code').textContent;
            document.body.appendChild(friendCodeInput);
            friendCodeInput.select();
            document.execCommand('copy');
            document.body.removeChild(friendCodeInput);
            copyBtn.textContent = 'Copied';
            setTimeout(() => {
              copyBtn.textContent = 'Copy';
            }, 1000);
          });
        });

        let curr_id;

        document.getElementById('searchUniqueCode').addEventListener('input', function() {
            let unique_code = document.getElementById('curr-user-unique-code').textContent
            $.ajax({
            url: "/profile/get/" + this.value,
            method: "GET",
            success: function (response) {
                $('#result').removeClass('hidden')
                $('#search_pic').attr('src', response.profile_picture_url)
                $('#search_nickname').text(response.nickname)
                $('#search_real_name').text(response.real_name)
                $('#search_country').text(response.country.name)
                $('#search_link').attr('href', '/profile/' + response.unique_code)
                $('#search-mutual').text(response.mutual_friend_count)
                curr_id = response.id
                if(unique_code == response.unique_code){
                    $('#search-mutual-link').attr('href', '/profile/' + response.unique_code + '/friends')
                }
                else{
                    $('#search-mutual-link').attr('href', '/profile/' + response.unique_code + '/friends/mutual')
                }
                if(response.invite_btn != "enabled"){
                    $('#send-btn').addClass('hidden')
                    $('#disabled-btn').removeClass('hidden')
                    $('#message').text(response.invite_btn)

                }
                else{
                    $('#send-btn').removeClass('hidden')
                    $('#disabled-btn').addClass('hidden')
                    $('#message').text("")
                }
            },
            error: function (response) {
                $('#result').addClass('hidden')
                curr_id = -1
            }
        });
    })

    $('#send-btn').click(function(){
        $.ajax({
            url: "/friend/add/" + curr_id,
            method: "GET",
            success: function (response) {
                $('#send-btn').addClass('hidden')
                $('#disabled-btn').removeClass('hidden')
                $('#message').text("You sent a friend request to this user")
            }
        });
    })

    $('#prevent').submit(function(e){
        e.preventDefault();
    })
    </script>
@endsection

