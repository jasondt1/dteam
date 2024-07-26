<nav class="py-5">
    <div class="content px-4">
        <a href="/store/show">
            <div class="w-[180px] h-[42px]">
                <img class="w-full h-full" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/logo_dteam.svg?alt=media&token=34b8ef99-1438-45c4-b6e8-fee1dd1b9fc3" alt="">
            </div>
        </a>
        <div class="menu-container">
            @if(Auth::user()->publisher)
            <a class="nav-link" href="/publisher/manage-game">MANAGE GAMES</a>
            <a class="nav-link" href="/publisher/edit-profile">EDIT PROFILE</a>
            @else
            <a class="nav-link" href="/publisher/welcome">SETUP PROFILE</a>
            @endif
            <a class="nav-link" href="/publisher/change-password">CHANGE PASSWORD</a>
            <a class="nav-link" href="/logout">LOGOUT</a>
        </div>
    </div>
</nav>
