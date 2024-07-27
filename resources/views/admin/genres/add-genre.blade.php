@extends('layout')

@section('title', 'DTeam :: Add Genre')
@section('css', asset('css/register.css'))

@section('content')
    <form action={{ route('data-genre-add') }} class="p-0 lg:px-8 flex flex-col gap-8" method="POST">
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
        <h1 class="text-4xl text-white font-light">ADD GENRE</h1>
        <div class="flex flex-col">
            <label for="genre_name" class="text-gray-300 text-sm">Genre Name</label>
            <input type="text" name="genre_name" id="genre_name" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('genre_name') border border-[#C15755] @enderror" value={{ old('genre_name') }}>
        </div>
        <button type="submit" class="blue-btn w-full md:max-w-40 py-2">Add</button>
    </form>

@endsection
