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
                    <a href="" class="link active">Avatar</a>
                    <a href={{ route('edit-profile-background')}} class="link">Profile Background</a>
                    <a href={{ route('edit-profile-security') }} class="link">Change Password</a>
                </div>
                <div class="right w-full md:w-3/4 mr-4">
                    <p class="text-2xl font-semibold mb-2">Avatar</p>
                    <p class="text-[#ADB2B7] text-sm mb-4">Choose your avatar image</p>
                    <div class="w-full">
                        @if ($errors->any())
                        <div class="w-full p-3 mb-6 error-msg">
                            @foreach ($errors->all() as $error)
                                <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">{{ $error }}</p>
                            @endforeach
                        </div>
                        @endif
                    </div>
                    <form id="avatar-form" action="{{ route('update-avatar') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="flex flex-col mb-6 gap-1 w-32 h-32">
                            <img id="profile-pic-preview" class="min-w-full min-h-full" src="{{ Auth::user()->profile_picture_url }}" alt="">
                        </div>
                        <input type="file" id="avatar-input" name="avatar" accept="image/*" class="hidden">
                        <input type="hidden" id="image-url" name="image_url"/>
                        <button type="button" class="cancel-btn py-1.5 px-8" onclick="document.getElementById('avatar-input').click()">Upload your avatar</button>
                        <div class="mt-5">
                            @if (Auth::user()->item_libraries->where('type', 'avatar')->count() > 0)
                              <p>Your Avatars</p>
                              <div class="mt-2">
                                <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-5">
                                  @foreach (Auth::user()->item_libraries as $item)
                                    @if ($item->type == 'avatar')
                                      <div class="w-full aspect-square cursor-pointer" onclick="setAvatar('{{$item->image_url}}')">
                                        <img class="w-full h-full imgs" src="{{ $item->image_url }}" alt="">
                                      </div>
                                    @endif
                                  @endforeach
                                </div>
                              </div>
                            @endif
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
    function setAvatar(url) {
        const avatar = document.getElementById("profile-pic-preview");
        avatar.src = url;
        document.getElementById("image-url").value = url;
    }
</script>
