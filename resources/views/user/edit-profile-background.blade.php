@extends('layout')

@section('css', asset('css/edit-profile.css'))

@section('content')
    <div class="container min-w-full -mt-8">
        <div class="profile-container">
            <div class="profile-top w-full">
                <div class="profile-pic">
                    <img id="profile-pic-current" src="{{ Auth::user()->profile_picture_url }}">
                </div>
                <div class="text-2xl font-light mb-1 text-white">{{ Auth::user()->nickname }} <span class="text-xs mx-1 text-[#828282]">>></span> <span class="text-sm">Edit Profile</span></div>
            </div>
            <div class="flex gap-5 flex-col md:flex-row mt-5">
                <div class="left w-full md:w-1/4 ml-4 flex flex-col gap-1 text-sm text-[#999999]">
                    <a href={{ route('edit-profile-general') }} class="link">General</a>
                    <a href={{ route('edit-profile-avatar') }} class="link">Avatar</a>
                    <a href="" class="link active">Profile Background</a>
                    <a href={{ route('edit-profile-security') }} class="link">Change Password</a>
                </div>
                <div class="right w-full md:w-3/4 mr-4">
                    <p class="text-2xl font-semibold mb-2">Profile Background</p>
                    <p class="text-[#ADB2B7] text-sm mb-4">Choose a background to show on your profile page</p>
                    <div class="w-full">
                        @if ($errors->any())
                        <div class="w-full p-3 mb-6 error-msg">
                            @foreach ($errors->all() as $error)
                                <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">{{ $error }}</p>
                            @endforeach
                        </div>
                        @endif
                    </div>
                    <form id="avatar-form" action="{{ route('update-background') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="w-[100%] m-auto relative">
                            <img class="w-full absolute" style="z-index: 1;" src="https://store.akamai.steamstatic.com/public/images/applications/store/background_preview.png?v=5a9bc2bea24a73b7800d442e16c6071e" alt="">
                            <img id="background-image" class="w-full absolute top-[0.2rem]" src={{Auth::user()->background_url}} alt="">
                        </div>
                        <input type="file" id="avatar-input" name="avatar" accept="image/*" class="hidden">
                        <input type="hidden" id="image-url" name="image_url"/>
                        <button type="button" class="cancel-btn py-1.5 px-8" onclick="document.getElementById('avatar-input').click()">Upload your avatar</button>
                        <div class="mt-[55%]">
                            <p class="mb-2">Your Profile Backgrounds</p>
                            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 gap-5">
                                <div class="w-full h-auto cursor-pointer" onclick="setBackground('https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac')">
                                    <img class="w-full h-full imgs" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac" alt="">
                                </div>
                                @foreach (Auth::user()->item_libraries as $item)
                                    @if ($item->type == 'background')
                                        <div class="w-full h-auto cursor-pointer" onclick="setBackground('{{$item->image_url}}')">
                                            <img class="w-full h-full imgs" src="{{ $item->image_url }}" alt="">
                                        </div>
                                    @endif
                                @endforeach
                            </div>
                        </div>

                        <div class="w-full flex justify-end mt-5">
                            <button class="w-48 save-btn py-1.5" type="submit">
                                <span class="submit-text" id="submit-text">Save</span>
                                <div class="loader m-auto hidden" id="loader"></div>

                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script type="module" src={{ asset('js/avatar.js') }}>
    </script>
@endsection

<script>
    function setBackground(url) {
        const avatar = document.getElementById("background-image");
        avatar.src = url;
        document.getElementById("image-url").value = url;
    }
</script>
