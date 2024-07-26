@extends('layout')

@section('css', asset('css/register.css'))

@section('content')
    <form action={{ route('data-change-password') }} class="p-0 lg:px-8 flex flex-col gap-8" method="POST">
        @csrf
        @method('PUT')
        <div class="w-full">
            @if ($errors->any())
            <div class="bg-black w-full p-3 border border-[#C15755]">
                @php $count = 0; @endphp
                @foreach ($errors->all() as $error)
                    @if ($count == 2)
                        <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">More errors highlighted below</p>
                        @break
                    @endif
                    <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">{{ $error }}</p>
                    @php $count++; @endphp
                @endforeach
            </div>
            @endif
            @if(session('success'))
            <div class="bg-green-700 w-full p-3">
                <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">{{ session('success') }}</p>
            </div>
            @endif
        </div>

        <h1 class="text-4xl text-white font-light">CHANGE PASSWORD</h1>
        <div class="flex flex-col">
            <label for="current_password" class="text-gray-300 text-sm">Current Password</label>
            <input type="password" name="current_password" id="current_password" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('current_password') border border-[#C15755] @enderror">
        </div>
        <div class="flex flex-col">
            <label for="new_password" class="text-gray-300 text-sm">New Password</label>
            <input type="password" name="new_password" id="new_password" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('new_password') border border-[#C15755] @enderror">
        </div>
        <div class="flex flex-col">
            <label for="confirm_new_password" class="text-gray-300 text-sm">Confirm New Password</label>
            <input type="password" name="confirm_new_password" id="confirm_new_password" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('confirm_new_password') border border-[#C15755] @enderror">
        </div>
        <button type="submit" class="blue-btn w-full md:max-w-40 py-2">
            <span class="submit-text">Submit</span>
            <div class="loader m-auto hidden"></div>
        </button>
    </form>
@endsection
