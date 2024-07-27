@extends('layout')

@section('title', 'DTeam :: History')
@section('css', asset('css/gift.css'))

@section('content')
    <div class="container min-w-full">
        <div class="profile-top w-full -mt-8">
            <div class="profile-pic">
                <img src={{ Auth::user()->profile_picture_url }}>
            </div>
            <div class="text-2xl font-light mb-1 text-white">{{ Auth::user()->nickname }} <span class="text-xs mx-1 text-[#828282]">>></span> <span class="text-sm">My Transaction</span></div>
        </div>
        <div class="friend mt-4 flex gap-6 flex-col md:flex-row">
            <div class="flex flex-col w-full">
                <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                    <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                        <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                            <table class="min-w-full divide-y divide-gray-200 text-white">
                                <thead class="bg-1">
                                    <tr>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider w-5">
                                            Date
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                            Items
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                            Type
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                            Status
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                            Wallet Change
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($histories as $history)
                                    @php
                                    $rowClass = $loop->index % 2 == 0 ? 'bg-1' : 'bg-2';
                                    if($history->game){
                                        $game = $history->game;
                                        $isGift = true;
                                    }
                                    else{
                                        $game = $history;
                                        $isGift = false;
                                    }
                                    @endphp
                                    <tr class="{{ $rowClass }} text-white">
                                        <td class="px-6 py-4 whitespace-nowrap text-xs font-medium search-date">
                                            @if($history->type == "wallet")
                                            {{$history->used_at}}
                                            @else
                                                @if($isGift)
                                                {{$history->created_at}}
                                                @else
                                                {{$history->pivot->created_at}}
                                                @endif
                                            @endif
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-xs font-medium">
                                            @if($history->type == "wallet")
                                            Purchase <span class="price">{{$history->amount}} </span> Wallet Credit
                                            @else
                                            {{$game->title}}
                                            @endif
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-xs font-medium">
                                            @if($isGift)
                                            Gift to
                                            <a href={{ route('profile', ['id'=>$history->receiver->unique_code]) }} class="underline text-white">{{$history->receiver->nickname}}</a>
                                            @else
                                            Purchase
                                            @endif
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-xs font-medium">
                                            @if($isGift)
                                                @if($history->status == 0)
                                                Pending
                                                @else
                                                Accepted
                                                @endif
                                            @else
                                            Success
                                            @endif
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-xs font-medium">
                                            @if($history->type == "wallet")
                                            +<span class="price">{{$history->amount}}</span>
                                            @else
                                                @php
                                                    if($isGift){
                                                        if($history->discount_percentage != 0){
                                                            $price = $game->price * (100 - $history->discount_percentage) / 100;
                                                        }
                                                        else{
                                                            $price = $game->price;
                                                        }
                                                    }
                                                    else{
                                                        if($history->pivot->discount_percentage != 0){
                                                            $price = $game->price * (100 - $history->discount_percentage) / 100;
                                                        }
                                                        else{
                                                            $price = $game->price;
                                                        }
                                                    }
                                                @endphp
                                            -<span class="price">{{$price}}</span>
                                            @endif
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @if ($histories->hasPages())
        <div class="mt-4 flex justify-center">
          {{ $histories->links() }}
        </div>
        @endif
    </div>
@endsection

