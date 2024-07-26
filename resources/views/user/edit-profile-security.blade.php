@extends('layout')

@section('css', asset('css/edit-profile.css'))

@section('content')
    <div class="container min-w-full -mt-8">
        <div class="profile-container">
            <div class="profile-top w-full">
                <div class="profile-pic">
                    <img src={{Auth::user()->profile_picture_url}}>
                </div>
                <div class="text-2xl font-light mb-1 text-white">{{Auth::user()->nickname}} <span class="text-xs mx-1 text-[#828282]">>></span> <span class="text-sm">Edit Profile</span></div>
            </div>
            <div class="flex gap-5 flex-col md:flex-row mt-5">
                <div class="left w-full md:w-1/4 ml-4 flex flex-col gap-1 text-sm text-[#999999]">
                    <a href={{ route('edit-profile-general') }} class="link">General</a>
                    <a href={{ route('edit-profile-avatar') }} class="link">Avatar</a>
                    <a href={{ route('edit-profile-background')}} class="link">Profile Background</a>
                    <a href="" class="link active">Change Password</a>
                </div>
                <div class="right w-full md:w-3/4 mr-4">
                    <p class="text-2xl font-semibold mb-6">Change Password</p>
                    <div class="w-full">
                        @if ($errors->any())
                        <div class="w-full p-3 mb-6 error-msg">
                            @foreach ($errors->all() as $error)
                                <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">{{ $error }}</p>
                            @endforeach
                        </div>
                        @endif
                    </div>
                    <form action="{{ route('data-change-password') }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="flex flex-col mb-6 gap-1">
                            <label for="current_password" class="uppercase text-sm text-[#A8ADB1]">Current Password</label>
                            <input type="password" class="px-2" id="current_password" name="current_password">
                        </div>
                        <div class="flex flex-col mb-6 gap-1">
                            <label for="new_password" class="uppercase text-sm text-[#A8ADB1]">New Password</label>
                            <input type="password" class="px-2" id="new_password" name="new_password">
                        </div>
                        <div class="flex flex-col mb-6 gap-1">
                            <label for="confirm_new_password" class="uppercase text-sm text-[#A8ADB1]">Confirm New Password</label>
                            <input type="password" class="px-2" id="confirm_new_password" name="confirm_new_password">
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
