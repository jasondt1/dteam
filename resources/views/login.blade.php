@extends('layout')

@section('title', 'Sign In - DTeam')
@section('css', asset('css/login.css'))

@section('content')
    <div class="mt-16 flex flex-col gap-8">
        <div class="outer flex flex-col gap-10 m-auto w-full md:w-3/4">
            <h1 class="text-3xl text-white font-bold text-center md:text-left">Sign in</h1>
            <div class="flex w-full form rounded-lg">
            <form action={{ route('data-login') }} class="flex flex-col gap-5 p-8 pr-0 rounded-lg m-auto justify-center items-center w-full" method="POST">
                @csrf
                    <div class="flex flex-col gap-5 rounded-lg m-auto w-full">
                        <div class="flex flex-col w-full">
                            <label for="email" class="text-[#1999FF] font-semibold text-[13px]">SIGN IN WITH EMAIL</label>
                            <input type="email" name="email" id="email" class="w-full h-9 rounded-sm field-bg px-3 text-white @error('invalid') border border-[#C15755] @enderror">
                        </div>
                        <div class="flex flex-col w-full">
                            <label for="password" class="text-gray-300 text-[13px]">PASSWORD</label>
                            <input type="password" name="password" id="password" class="w-full h-9 rounded-sm field-bg px-3 text-white @error('invalid') border border-[#C15755] @enderror">
                    </div>
                    <div class="flex justify-left w-full custom-checkbox-container">
                        <input id="default-checkbox" type="checkbox" class="custom-checkbox-input" name="remember" {{ old('remember') ? 'checked' : '' }}>
                        <label for="default-checkbox" class="checkbox-label">
                            <span class="checkmark"></span>
                            <span class="w-1.5"></span>
                            Remember Me
                        </label>
                    </div>
                        <button type="submit" class="blue-btn w-3/4 py-3 m-auto">Sign In</button>
                        @error('invalid')
                            <div class="text-[#C15755] font-semibold m-auto text-center h-5 text-xs -mb-2">
                                <p>Please check your email and password and try again.</p>
                            </div>
                        @enderror
                        <a class="text-[#AFAFAF] hover:text-[#C9C9C9] underline text-xs text-center" href={{ route('forgot-password') }}>Forgot Password?</a>
                    </form>
                    </div>
                    <div class="flex items-center img-container"><img src={{asset('images/logo.png')}} alt="" width="450"></div>
                </div>
        </div>
    </div>
    <script>
            const inputs = document.querySelectorAll('input')
            inputs.forEach(input => {
                input.addEventListener('click', () => {
                    input.classList.remove('border')
                    input.classList.remove('border-[#C15755]')
                })
            })
    </script>
@endsection
