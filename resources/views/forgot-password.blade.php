@extends('layout')

@section('title', 'Forgot Password - DTeam')
@section('css', asset('css/2fa.css'))

@section('content')
<div class="container min-w-full flex items-center justify-center">
    <div class="flex flex-col items-center gap-6 w-full lg:mt-10">
        <div class="w-[240px] h-[60px]">
            <img class="w-full h-full" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/logo_dteam.svg?alt=media&token=34b8ef99-1438-45c4-b6e8-fee1dd1b9fc3" alt="">
        </div>
        <div class="flex justify-center items-center bg-[#181A20] px-6 py-4 rounded-lg shadow-lg">
            <div class="p-4 max-w-md w-full">
                <h2 class="text-2xl font-semibold text-center text-white mb-1.5">Forgot Password</h2>
                <p class="text-gray-300 mb-4 text-sm text-center">We will send you a new password to your email.</p>
                <form action={{ route('check-forgot-password') }} method="POST">
                    @csrf
                    <div class="flex flex-col w-full">
                        <label for="email" class="text-gray-300 text-[13px] uppercase">Email</label>
                        <input type="email" name="email" id="email" class="w-72 md:w-96 h-9 rounded-sm field-bg px-3 text-white @error('email') border border-[#C15755] @enderror">
                </div>
                    <button type="submit" class="w-full py-3 px-4 blue-btn text-white rounded mt-4">Forgot Password</button>
                </form>
                @error('email')
                <div class="text-[#C15755] font-semibold m-auto text-center h-5 text-xs mt-4">
                    <p>Email not found.</p>
                </div>
                @enderror
                <div class="text-[#AFAFAF] hover:text-[#C9C9C9] underline text-center mt-4 text-xs"><a href={{ route('login') }} class="cursor-pointer hover:underline">Back to login</a></div>
            </div>
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
