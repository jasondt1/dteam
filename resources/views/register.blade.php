@extends('layout')

@section('title', 'Register - DTeam')
@section('css', asset('css/register.css'))

@section('content')
    <form action={{ route('data-register') }} class="p-0 lg:px-8 flex flex-col gap-8" method="POST">
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
        <h1 class="text-4xl text-white font-light">CREATE YOUR ACCOUNT</h1>
    <div class="flex flex-col">
            <label for="email" class="text-gray-300 text-sm">Email</label>
            <input type="email" name="email" id="email" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('email') border border-[#C15755] @enderror" value={{ old('email') }}>
        </div>
        <div class="flex flex-col">
            <label for="password" class="text-gray-300 text-sm">Password</label>
            <input type="password" name="password" id="password" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('password') border border-[#C15755] @enderror" value={{ old('password') }}>
        </div>
        <div class="flex flex-col">
            <label for="confirm-password" class="text-gray-300 text-sm">Confirm Password</label>
            <input type="password" name="confirm-password" id="confirm-password" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('confirm-password') border border-[#C15755] @enderror" value={{ old('confirm-password') }}>
        </div>
        <div id="agr" class="flex @error('agreement') border border-[#C15755] @enderror">
            <input id="default-checkbox" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" name="agreement" {{ old('agreement') ? 'checked' : '' }}>
            <label for="default-checkbox" class="ms-2 text-sm font-light text-gray-900 dark:text-gray-300" >I am 13 years of age or older and agree to the terms of the Steam Subscriber Agreement and the Valve Privacy Policy.</label>
        </div>
        <button type="submit" class="blue-btn w-full md:max-w-40 py-2">Register</button>
    </form>
    <script>
         const inputs = document.querySelectorAll('input')
            inputs.forEach(input => {
                input.addEventListener('click', () => {
                    input.classList.remove('border')
                    input.classList.remove('border-[#C15755]')
                    if(input.type == 'checkbox'){
                        document.getElementById('agr').classList.remove('border')
                        document.getElementById('agr').classList.remove('border-[#C15755]')
                    }
                })
            })
    </script>
@endsection
