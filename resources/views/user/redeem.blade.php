@extends('layout')

@section('css', asset('css/redeem.css'))

@section('content')
    <div class="container min-w-full">
        @include('components.inner-navbar')
        <div class="cart-container mt-5">
            <div class="title">
                <h1 class="text-4xl text-white font-light">REDEEM A DTEAM GIFT CARD OR WALLET CODE</h1>
            </div>

            <div class="cart-section flex gap-5 flex-col md:flex-row mt-14">
                <div class="left w-full md:w-2/3 pr-10">

                    <form action={{ route('wallet-redeem') }} class="flex flex-col mt-5" method="POST">
                        @csrf
                        <div class="w-full">
                            @if ($errors->any())
                            <div class="invalid-bg w-full p-3 mb-5 shadow-lg">
                                @php $count = 0; @endphp
                                @foreach ($errors->all() as $error)
                                    @if ($count == 2)
                                        <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">More errors highlighted below.</p>
                                        @break
                                    @endif
                                    <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">{{ $error }}</p>
                                    @php $count++; @endphp
                                @endforeach
                            </div>
                            @endif
                            @if (session('success'))
                            <div class="text-white mb-6 text-sm bg-[#5c7e0f] p-3 shadow-lg">
                                <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">{{ session('success') }}</p>
                            </div>
                            @endif
                        </div>
                        <h2 class="text-xl text-white tracking-wide mb-5">ENTER YOUR DTEAM WALLET CODE TO ADD FUNDS TO YOUR DTEAM WALLET</h2>
                        <div class="flex flex-col">
                            <label for="code" class="text-gray-300 text-sm">DTeam Wallet Code</label>

                        </div>
                        <div class="flex gap-3">
                            <input type="text" name="code" id="code" class="w-full h-9 rounded-sm field-bg px-3 text-white field" value={{ old('code') }}>
                            <button type="submit" class="continue-btn w-full md:max-w-32 rounded-sm">Redeem</button>
                        </div>
                        <p class="text-xs mt-2 text-[#C9D4DE]">Note: If the gift card you attempt to redeem is not in your currency, it will be automatically converted if redeemable in your region. Not all gift card currencies can be redeemed in all regions.</p>
                    </form>
                </div>

                <div class="right w-full md:w-1/3 mt-6">
                    <p class="py-1 px-2 bg-[#303742] text-[#CAD5D5] text-sm">Your DTeam Account</p>
                    <div class="flex flex-col cart-modal-container p-4 gap-3">
                        <div class="flex justify-between items-center">
                            <h2 class="font-medium text-sm">Wallet Balance</h2>
                            <p class="font-bold price">{{ Auth::user()->wallet }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src={{ asset('js/cart.js') }}></script>
@endsection
