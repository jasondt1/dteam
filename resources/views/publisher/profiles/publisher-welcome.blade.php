@extends('layout')

@section('title', 'DTeam :: Welcome')
@section('css', asset('css/register.css'))

@section('content')
    <form id="publisherForm" action={{ route('data-publisher-setup') }} class="p-0 lg:px-8 flex flex-col gap-8" method="POST">
        @csrf
        <div class="w-full">
            @if ($errors->any())
            <div class="bg-black w-full p-3 border border-[#C15755]">
                @php $count = 0; @endphp
                @foreach ($errors->all() as $error)
                    @if ($count == 2)
                        <p class="text-white text-sm" style="text-shadow: 2px 2px #5b5b5b;">More errors highlighted below.</p>
                        @break
                    @endif
                    <p class="text-white text-sm" style="text-shadow: 2px 2px #5b5b5b;">{{ $error }}</p>
                    @php $count++; @endphp
                @endforeach
            </div>
            @endif
        </div>
        <h1 class="text-4xl text-white font-light">SETUP YOUR ACCOUNT</h1>
        <div class="flex flex-col">
            <label for="publisher_name" class="text-gray-300 text-sm">Publisher Name</label>
            <input type="text" name="publisher_name" id="publisher_name" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('publisher_name') border border-[#C15755] @enderror" value="{{ old('publisher_name') }}">
        </div>
        <div class="flex flex-col">
            <label for="publisher_website" class="text-gray-300 text-sm">Publisher Website</label>
            <input type="text" name="publisher_website" id="publisher_website" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('publisher_website') border border-[#C15755] @enderror" value="{{ old('publisher_website') }}">
        </div>
        <div class="flex flex-col">
            <label for="profile_picture" class="text-gray-300 text-sm mb-2">Publisher Logo</label>
            <input type="file" id="profile_picture" name="profile_picture" class="hidden" accept="image/jpeg, image/png">
            <img id="profile_picture_placeholder" src="https://lh3.googleusercontent.com/proxy/rnI3_En64EP7f3eLxeUK59zazrOt3DPuEhk8NOfOY_jdK7VbA7ucKFfwPTqdi_wFZCDyEWJ7hDnZq6D-94CPn7Qlp3A8tmPuWmJZf4aO3kbPtBnKfwVtZw" class="w-32 h-32 object-cover cursor-pointer">
        </div>
        <input type="hidden" id="image_url" name="image_url" value="https://lh3.googleusercontent.com/proxy/rnI3_En64EP7f3eLxeUK59zazrOt3DPuEhk8NOfOY_jdK7VbA7ucKFfwPTqdi_wFZCDyEWJ7hDnZq6D-94CPn7Qlp3A8tmPuWmJZf4aO3kbPtBnKfwVtZw">
        <button type="submit" class="blue-btn w-full md:max-w-40 py-2">
            <span class="submit-text">Submit</span>
            <div class="loader m-auto hidden"></div>
        </button>
    </form>
    <script type="module" src="{{ asset('js/publisher-welcome.js') }}"></script>
@endsection
