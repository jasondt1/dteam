@extends('layout')

@section('title', 'Add Game - DTeam')
@section('css', asset('css/register.css'))

@section('content')
    <form id="gameForm" action={{ route('data-game-add') }} class="p-0 lg:px-8 flex flex-col gap-8" method="POST">
        @csrf
        <div class="w-full">
            @if ($errors->any())
            <div class="bg-black w-full p-3 border border-[#C15755]">
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
        </div>
        <h1 class="text-4xl text-white font-light">ADD GAME</h1>
        <div class="flex flex-col">
            <label for="game_title" class="text-gray-300 text-sm">Title</label>
            <input type="text" name="game_title" id="game_title" class="w-full md:max-w-full h-9 rounded-sm field-bg px-3 text-white @error('game_title') border border-[#C15755] @enderror" value="{{ old('game_title') }}">
        </div>
        <div class="flex flex-col">
            <label for="game_brief_description" class="text-gray-300 text-sm">Brief Description</label>
            <textarea name="game_brief_description" id="game_brief_description" class="resize-none w-full h-32 rounded-sm field-bg px-3 py-2 text-white @error('game_brief_description') border border-[#C15755] @enderror">{{ old('game_brief_description') }}</textarea>
        </div>
        <div class="flex flex-col">
            <label for="game_full_description" class="text-gray-300 text-sm">Full Description</label>
            <div id="txt" class="w-full @error('game_full_description') border border-[#C15755] @enderror"><textarea name="game_full_description" id="game_full_description" class="full w-full h-64 rounded-sm field-bg p-3 text-white ">{{ old('game_full_description') }}</textarea></div>
        </div>
        <div class="flex flex-col">
            <label for="release_date" class="text-gray-300 text-sm">Release Date</label>
            <input type="date" name="release_date" id="release_date" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('release_date') border border-[#C15755] @enderror" value="{{ old('release_date') }}">
        </div>
        <div class="flex flex-col">
            <label for="price" class="text-gray-300 text-sm">Price</label>
            @php
                $price = old('original_price');
                if ($price) {
                    $price = 'Rp ' . number_format($price, 0, ',', '.');
                }
            @endphp
            <input type="text" name="price" id="price" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('original_price') border border-[#C15755] @enderror" value="{{ $price }}">
            <input type="hidden" name="original_price" id="original_price" value="{{ old('original_price') }}">
        </div>
        <div class="flex flex-col">
            <label for="discount_percentage" class="text-gray-300 text-sm">Discount Percentage</label>
            <input type="text" name="discount_percentage" id="discount_percentage" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('discount_percentage') border border-[#C15755] @enderror" value={{ old('discount_percentage') }}>
        </div>
        <div class="flex flex-col @error('age_rating') border border-[#C15755] @enderror">
            <label class="text-gray-300 text-sm mb-1">Age Rating</label>
            <div class="custom-radio-group">
                <input type="radio" id="pegi3" name="age_rating" value="1" class="custom-radio-input">
                <label for="pegi3" class="radio-label">
                    <span class="radio-checkmark"></span>
                    PEGI 3
                </label>
            </div>
            <div class="custom-radio-group">
                <input type="radio" id="pegi7" name="age_rating" value="2" class="custom-radio-input">
                <label for="pegi7" class="radio-label">
                    <span class="radio-checkmark"></span>
                    PEGI 7
                </label>
            </div>
            <div class="custom-radio-group">
                <input type="radio" id="pegi12" name="age_rating" value="3" class="custom-radio-input">
                <label for="pegi12" class="radio-label">
                    <span class="radio-checkmark"></span>
                    PEGI 12
                </label>
            </div>
            <div class="custom-radio-group">
                <input type="radio" id="pegi16" name="age_rating" value="4" class="custom-radio-input">
                <label for="pegi16" class="radio-label">
                    <span class="radio-checkmark"></span>
                    PEGI 16
                </label>
            </div>
            <div class="custom-radio-group">
                <input type="radio" id="pegi18" name="age_rating" value="5" class="custom-radio-input">
                <label for="pegi18" class="radio-label">
                    <span class="radio-checkmark"></span>
                    PEGI 18
                </label>
            </div>
        </div>
        <div class="flex flex-col @error('genres') border border-[#C15755] @enderror">
            <label class="text-gray-300 text-sm mb-1">Genres (Min 1, Max 3)</label>
            @foreach ($genres as $genre)
                <div class="custom-checkbox">
                    <input type="checkbox" id="genre{{$genre->id}}" name="genres[]" value="{{$genre->id}}" {{ in_array($genre->id, old('genres', [])) ? 'checked' : '' }}>
                    <label for="genre{{$genre->id}}" class="checkbox-label">
                        <span class="checkmark"></span>
                        {{$genre->name}}
                    </label>
                </div>
            @endforeach
        </div>
        <div class="flex flex-col">
            <label for="video_file" class="text-gray-300 text-sm">Trailer / Gameplay Video</label>
            <input type="file" name="video_file" id="video_file" class="text-white @error('video_url') border border-[#C15755] py-2 @enderror" accept="video/*">
        </div>
        <div id="videoPreview" class="w-full">
            <label class="text-gray-300 text-sm">Preview</label>
            <video controls class="w-full rounded-sm">
                <source id="videoSource" src="{{old('video_url')}}" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>
        <div class="flex flex-col">
            <label for="image_files" class="text-gray-300 text-sm mb-1">Game Images (Min 5), First Image will be the Thumbnail</label>
            <input type="file" name="image_files[]" id="image_files" class="hidden" accept="image/*" multiple >
            <div class="w-full @error('image_urls') border border-[#C15755] py-2 @enderror">            <button type="button" id="imageButton" class="white-btn w-full md:max-w-80 py-2">Add Image</button></div>

        </div>
        <div id="imagePreview" class="flex flex-wrap gap-4">
            @if(old('image_urls'))
                @foreach(old('image_urls') as $image_url)
                    <div class="relative inline-block">
                        <img src="{{$image_url}}" class="w-56 h-36 object-cover rounded-sm border border-gray-300">
                        <button style="filter:drop-shadow(1px 1px 1px #000)" type="button" class="absolute top-1 right-1 bg-white text-black text-xl rounded-full w-6 h-6 flex items-center justify-center remove-image">&times;</button>
                        <input type="hidden" name="image_urls[]" value="{{$image_url}}">
                    </div>
                @endforeach
            @endif
        </div>
        <input type="hidden" name="video_url" id="video_url" value="{{old('video_url')}}">

        <button type="submit" class="blue-btn w-full md:max-w-40 py-2 mb-8" id="submit-btn">
            <span class="submit-text">Submit</span>
            <div class="loader m-auto hidden"></div>
        </button>
    </form>
    <script src={{ asset('js/tinymce/tinymce.min.js') }}></script>
    <script type="module" src={{ asset('js/add-game.js') }}></script>
    <script>
   const inputs = document.querySelectorAll('input');
    const textareas = document.querySelectorAll('textarea');
    const radioButtons = document.querySelectorAll('input[type="radio"]');
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    const imageButton = document.getElementById('imageButton');
    const imagePreview = document.getElementById('imagePreview');

    inputs.forEach(input => {
        input.addEventListener('click', () => {
            input.classList.remove('border');
            input.classList.remove('border-[#C15755]');
        });
    });

    textareas.forEach(textarea => {
        textarea.addEventListener('click', () => {
            textarea.classList.remove('border');
            textarea.classList.remove('border-[#C15755]');
        });
    });

    radioButtons.forEach(radio => {
        radio.addEventListener('click', () => {
            radio.parentElement.parentElement.classList.remove('border');
            radio.parentElement.parentElement.classList.remove('border-[#C15755]');
        });
    });

    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('click', () => {
            checkbox.parentElement.parentElement.classList.remove('border');
            checkbox.parentElement.parentElement.classList.remove('border-[#C15755]');
        });
    });

    imageButton.addEventListener('click', () => {
        imageButton.parentElement.classList.remove('border');
        imageButton.parentElement.classList.remove('border-[#C15755]');
    });

    imagePreview.addEventListener('click', (e) => {
        if (e.target.classList.contains('remove-image')) {
            e.target.parentElement.classList.remove('border');
            e.target.parentElement.classList.remove('border-[#C15755]');
        }
    });

    </script>
@endsection
