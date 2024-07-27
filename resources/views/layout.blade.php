<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title')</title>
    <link rel="icon" type="image/png" href="https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Steam_icon_logo.svg/2048px-Steam_icon_logo.svg.png">
    <link rel="stylesheet" href={{asset('css/navbar.css')}}>
    <link rel="stylesheet" href={{asset('css/global.css')}}>
    <link rel="stylesheet" href=@yield('css')>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Condensed&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script
    src="https://code.jquery.com/jquery-3.7.1.min.js"
    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
    @auth
        @if(Auth::user()->get_role() == 'admin')
            @include('components.admin-navbar')
        @elseif (Auth::user()->get_role() == 'publisher')
            @include('components.publisher-navbar')
        @elseif (Auth::user()->get_role() == 'user')
            @include('components.user-navbar')
        @else
            @include('components.navbar')
        @endif
    @else
        @include('components.navbar')
    @endauth
    <div class="main {{ Route::currentRouteName() == 'profile' ? '' : 'p-8' }}">
        @yield('content')
    </div>
    {{-- @include('components.footer') --}}
    @if (Route::currentRouteName() == 'login')
        @include('components.footer')
    @endif
    <script src={{ asset('js/script.js') }}></script>
</body>
</html>
