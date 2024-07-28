@extends('layout')

@section('title', 'Welcome - DTeam')
@section('css', asset('css/edit-profile.css'))

@section('content')
    <div class="container min-w-full -mt-8">
        <div class="profile-container">
            <div class="profile-top w-full">
                <div class="profile-pic">
                    <img src={{Auth::user()->profile_picture_url}}>
                </div>
                <div class="text-2xl font-light mb-1 text-white">{{Auth::user()->nickname}} <span class="text-xs mx-1 text-[#828282]">>></span> <span class="text-sm">Setup Your Profile</span></div>
            </div>
            <div class="flex gap-5 flex-col md:flex-row mt-5">
                <div class="left w-full md:w-1/4 ml-4 flex flex-col gap-1 text-sm text-[#999999]">
                    <a href="" class="link active">Setup Your Profile</a>
                </div>
                <div class="right w-full md:w-3/4 mr-4">
                    <p class="text-2xl font-semibold mb-6">Setup Your Profile</p>
                    <div class="w-full">
                        @if ($errors->any())
                        <div class="w-full p-3 mb-6 error-msg">
                            @foreach ($errors->all() as $error)
                                <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">{{ $error }}</p>
                            @endforeach
                        </div>
                        @endif
                    </div>
                    <form action="{{ route('update-setup') }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="flex flex-col mb-6 gap-1">
                            <label for="nickname" class="uppercase text-sm text-[#A8ADB1]">Nickname</label>
                            <input type="text" class="px-2" id="nickname" name="nickname" value="{{ old('nickname', Auth::user()->nickname) }}">
                        </div>
                        <div class="flex flex-col mb-6 gap-1">
                            <label for="realname" class="uppercase text-sm text-[#A8ADB1]">Real Name</label>
                            <input type="text" class="px-2" id="realname" name="real_name" value="{{ old('real_name', Auth::user()->real_name) }}">
                        </div>
                        <div class="flex flex-col mb-6 gap-1">
                            <label for="location" class="uppercase text-sm text-[#A8ADB1]">Country</label>
                            <select name="country" id="country" class="px-2">
                                <option value="" {{ is_null(old('country', Auth::user()->country)) ? 'selected' : '' }}>Select a country</option>
                                @foreach ($countries as $country)
                                <option value="{{ $country->id }}" {{ old('country', Auth::user()->country ? Auth::user()->country->id : '') == $country->id ? 'selected' : '' }}>
                                    {{ $country->name }}
                                </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="flex flex-col mb-6 gap-1">
                            <label for="bio" class="uppercase text-sm text-[#A8ADB1]">Bio</label>
                            <textarea name="bio" class="p-2 h-36" id="bio" style="resize: none">{{ old('bio', Auth::user()->bio) }}</textarea>
                        </div>

                        <div class="w-full flex justify-end">
                            <button class="w-48 save-btn py-1.5" type="submit">Save</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
    <script src={{ asset('js/cart.js') }}></script>
@endsection
