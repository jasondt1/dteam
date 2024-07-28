@extends('layout')

@section('title', 'Verification - DTeam')
@section('css', asset('css/2fa.css'))

@section('content')
<div class="container min-w-full flex items-center justify-center">
    <div class="flex flex-col items-center gap-6 w-full lg:mt-10">
        <div class="w-[240px] h-[60px]">
            <img class="w-full h-full" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/logo_dteam.svg?alt=media&token=34b8ef99-1438-45c4-b6e8-fee1dd1b9fc3" alt="">
        </div>
        <div class="flex justify-center items-center bg-[#181A20] px-6 py-4 rounded-lg shadow-lg">
            <div class="p-4 max-w-md w-full">
                <h2 class="text-2xl font-semibold text-center text-white mb-8">Account: {{ Auth::user()->email }}</h2>
                <form action={{ route('verify') }} method="POST">
                    @csrf
                    <div class="mb-4">
                        <input type="hidden" id="code" name="code">
                        <div class="verification-code-container p-2 @error('code') border border-[#C15755] @enderror">
                            <input id="1" type="text" maxlength="1" class="verification-code-input uppercase" required spellcheck="false">
                            <label for="1" class="w-3 sm:w-5 cursor-text"></label>
                            <input id="2" type="text" maxlength="1" class="verification-code-input uppercase" required spellcheck="false">
                            <label for="2" class="w-3 sm:w-5 cursor-text"></label>
                            <input id="3" type="text" maxlength="1" class="verification-code-input uppercase" required spellcheck="false">
                            <label for="3" class="w-3 sm:w-5 cursor-text"></label>
                            <input id="4" type="text" maxlength="1" class="verification-code-input uppercase" required spellcheck="false">
                            <label for="4" class="w-3 sm:w-5 cursor-text"></label>
                            <input id="5" type="text" maxlength="1" class="verification-code-input uppercase" required spellcheck="false">
                        </div>
                        @if($errors->has('code'))
                            <p id="error-text" class="text-[#C15755] text-sm mt-2 text-center">{{ $errors->first('code') }}</p>
                        @endif
                        <p class="text-gray-400 text-center mt-4">Enter the code from your email</p>
                    </div>
                    <button type="submit" class="w-full py-3 px-4 blue-btn text-white rounded mt-2">Verify</button>
                </form>
                <p class="text-gray-400 text-center mt-6">Didn't receive the code? <a href={{ route('resend') }} class="cursor-pointer text-blue-500 hover:underline">Resend</a></p>
            </div>
        </div>
    </div>
</div>

<script>
    document.querySelectorAll('.verification-code-input').forEach((input, index, inputs) => {
        input.addEventListener('input', () => {
            if (input.value.length > 0 && index < inputs.length - 1) {
                inputs[index + 1].focus();
            }
            updateHiddenInput();
            clearErrorStyles();
        });

        input.addEventListener('keydown', (event) => {
            if (event.key === 'Backspace' && input.value.length === 0 && index > 0) {
                inputs[index - 1].focus();
            }
        });

        input.addEventListener('paste', (event) => {
            event.preventDefault();
            const paste = (event.clipboardData || window.clipboardData).getData('text');
            const pasteArray = paste.split('').slice(0, inputs.length);
            pasteArray.forEach((char, i) => {
                inputs[i].value = char;
            });
            updateHiddenInput();
            clearErrorStyles();
        });
    });

    function updateHiddenInput() {
        const code = Array.from(document.querySelectorAll('.verification-code-input'))
                          .map(input => input.value)
                          .join('');
        document.getElementById('code').value = code;
    }

    function clearErrorStyles() {
        const container = document.querySelector('.verification-code-container');
        container.classList.remove('border', 'border-[#C15755]');
        const errorText = document.getElementById('error-text')
        if (errorText) {
            errorText.style.display = 'none';
        }
    }
</script>

@endsection
