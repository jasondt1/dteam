<nav class="py-5" style="z-index: 12">
    <div class="content px-4 relative">
        <a href="/store/show">
            <div class="w-[180px] h-[42px]">
                <img class="w-full h-full" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/logo_dteam.svg?alt=media&token=34b8ef99-1438-45c4-b6e8-fee1dd1b9fc3" alt="">
            </div>
        </a>

        <div class="menu-container">
            <a class="nav-link" href="{{ route('store') }}">STORE</a>
            <a class="nav-link" href={{ route('show-user-games', ['id'=>Auth::user()->unique_code]) }}>LIBRARY</a>
            <a class="nav-link uppercase" href={{ route('profile', ['id'=>Auth::user()->unique_code]) }}>
                @if(isset(Auth::user()->nickname))
                    {{ Auth::user()->nickname }}
                @else
                    Profile
                @endif
            </a>
        </div>
        @php
        $pendingGiftsCount = Auth::user()->received_gifts->filter(function ($gift) {
            return $gift->status == 0;
        })->count();
        @endphp
        <div class="absolute top-0 right-0">
            <div class="absolute -top-3.5 right-8 flex gap-1.5 items-center">
                <div class="min-w-max -mt-2">
                    <a class="text-xs font-light" href="https://store.steampowered.com/about/">
                        <p class="hidden lg:flex small-text font-light top-nav-btn gap-0.5 items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" height="18px" viewBox="0 -960 960 960" width="18px" fill="#FFFFFF">
                                <path d="M480-336 288-528l51-51 105 105v-342h72v342l105-105 51 51-192 192ZM263.72-192Q234-192 213-213.15T192-264v-72h72v72h432v-72h72v72q0 29.7-21.16 50.85Q725.68-192 695.96-192H263.72Z"/>
                            </svg> Install Steam
                        </p>
                    </a>
                </div>
                <div class="min-w-max -mt-2 dropdown-pending">
                    <a class="text-xs font-light" href="javascript:void(0);" id="pending-dropdown-toggle">
                        <p class="small-text font-light top-nav-btn flex gap-0.5 items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" height="18px" viewBox="0 -960 960 960" width="18px" fill="#FFFFFF">
                                <path d="M192-216v-72h48v-240q0-87 53.5-153T432-763v-53q0-20 14-34t34-14q20 0 34 14t14 34v53q85 16 138.5 82T720-528v240h48v72H192Zm288-276Zm-.21 396Q450-96 429-117.15T408-168h144q0 30-21.21 51t-51 21ZM312-288h336v-240q0-70-49-119t-119-49q-70 0-119 49t-49 119v240Z"/>
                            </svg>
                        </p>
                    </a>
                    <div class="dropdown-menu shadow-xl hidden absolute mt-[3px] -left-[45px] w-48 bg-[#3E444F] text-[#DCDEDF]" style="z-index: 999" id="pending-dropdown-menu">
                        @if(Auth::user()->received_friend_requests->count() > 0)
                        <a href={{ route('show-pending', ['id'=>Auth::user()->unique_code]) }} class="block px-4 py-2 text-xs notif-link flex gap-2 items-center"><svg xmlns="http://www.w3.org/2000/svg" height="16px" viewBox="0 -960 960 960" width="16px" fill="#DCDEDF"><path d="M450-483q26-30 40-66.12 14-36.12 14-74.88 0-38.41-14-74.21Q476-734 450-765q8-2 15-2.5t15-.5q60 0 102 42t42 102q0 60-42 102t-102 42q-8 0-15.5-.5T450-483Zm198 291v-92q0-41-19-76.5T576-421q68 16 130 44t62 93v92H648Zm132-240v-84h-84v-72h84v-84h72v84h84v72h-84v84h-72Zm-492-48q-60 0-102-42t-42-102q0-60 42-102t102-42q60 0 102 42t42 102q0 60-42 102t-102 42ZM0-192v-92q0-25.41 12.5-46.7Q25-352 47-366q54-34 115.54-50 61.54-16 125-16T412-415q61 17 117 49 21 14 34 35.3 13 21.29 13 46.7v92H0Zm287.5-360q29.5 0 51-21 21.5-21.01 21.5-50.5 0-29.5-21.5-51t-51-21.5q-29.49 0-50.5 21.5-21 21.5-21 51 0 29.49 21 50.5 21.01 21 50.5 21ZM72-264h432v-20q0-6.07-3-11.03-3-4.97-8-8.97-48-26-99.5-41t-106-15q-54.5 0-106 14.5T83-304q-5 4-8 8.97-3 4.96-3 11.03v20Zm216-360Zm0 360Z"/></svg> {{Auth::user()->received_friend_requests->count()}} New Friend Requests </a>
                        @endif
                        @if($pendingGiftsCount > 0)
                        <a href={{ route('gift') }} class="block px-4 py-2 text-xs notif-link flex gap-2 items-center"><svg class="-translate-x-[2px]" xmlns="http://www.w3.org/2000/svg" height="16px" viewBox="0 -960 960 960" width="16px" fill="#DCDEDF"><path d="M168-288v72h624v-72H168Zm0-432h103q-3-9-4.5-18t-1.5-18q0-45 31.5-76.5T376-864q23 0 44 9.5t35 28.5l25 35 26-34q14-18 33.98-28.5Q559.95-864 583-864q51 0 81.5 31t30.5 77q0 9-1.5 18t-4.5 18h103q29.7 0 50.85 21.15Q864-677.7 864-648v432q0 29.7-21.15 50.85Q821.7-144 792-144H168q-29 0-50.5-21.15T96-216v-432q0-29.7 21.5-50.85Q139-720 168-720Zm0 336h624v-264H585l88 119-58 43-134.5-184L346-486l-58-43 87-119H168v264Zm203.79-337q15.21 0 25.71-10.29t10.5-25.5q0-15.21-10.29-25.71t-25.5-10.5q-15.21 0-25.71 10.29t-10.5 25.5q0 15.21 10.29 25.71t25.5 10.5Zm216 0q15.21 0 25.71-10.29t10.5-25.5q0-15.21-10.29-25.71t-25.5-10.5q-15.21 0-25.71 10.29t-10.5 25.5q0 15.21 10.29 25.71t25.5 10.5Z"/></svg>  {{$pendingGiftsCount}} New Received Gifts </a>
                        @endif
                        @if(Auth::user()->received_gifts->count() == 0 && Auth::user()->received_friend_requests->count() == 0)
                            <p class="text-xs text-center py-2">There is no new notifications</p>
                        @endif
                    </div>
                </div>
                <div class="flex flex-col text-xs mx-2 min-w-max dropdown">
                    <p class="top-nav-label -mt-2 min-w-max flex items-center cursor-pointer" id="dropdown-toggle">
                        {{ Auth::user()->nickname }}
                        <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#e8eaed">
                            <path d="M480-384 288-576h384L480-384Z"/>
                        </svg>
                    </p>
                    <div class="dropdown-menu shadow-xl hidden absolute mt-4 right-12 w-48 bg-[#3E444F] text-[#DCDEDF]" style="z-index: 99999; translate-z: 1000;" id="dropdown-menu">
                        <a href={{ route('profile', ['id'=>Auth::user()->unique_code]) }} class="block px-4 py-2 text-xs drop-link">View My Profile</a>
                        <a href="/redeem/show" class="block px-4 py-2 text-xs drop-link">Redeem Wallet</a>
                        <a href="/user/purchase-history" class="block px-4 py-2 text-xs drop-link">My Transaction</a>
                        <a href="/logout" class="block px-4 py-2 text-xs drop-link">Logout</a>
                    </div>
                </div>
                <div>
                    <a href={{ route('profile', ['id'=>Auth::user()->unique_code]) }}><img class="nav-profile" src="{{ Auth::user()->profile_picture_url ? Auth::user()->profile_picture_url : 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/' }}" alt=""></a>

                </div>
            </div>
            <p class="top-nav-label price absolute right-20 mr-2 top-2.5 w-60 text-right">{{Auth::user()->wallet}}</p>
        </div>
    </div>
</nav>

<style>
    .dropdown-menu {
        display: none;
    }
    .show {
        display: block;
        z-index: 9999;
    }
</style>

<script>
document.addEventListener('DOMContentLoaded', (event) => {
    const dropdownToggle = document.getElementById('dropdown-toggle');
    const dropdownMenu = document.getElementById('dropdown-menu');
    const pendingDropdownToggle = document.getElementById('pending-dropdown-toggle');
    const pendingDropdownMenu = document.getElementById('pending-dropdown-menu');

    function toggleDropdown(menu) {
        menu.classList.toggle('show');
        document.getElementById('inner-navbar').style.zIndex = -1;
    }

    function closeDropdown(menu) {
        if (menu.classList.contains('show')) {
            menu.classList.remove('show');
            document.getElementById('inner-navbar').style.zIndex = 1;
        }
    }

    dropdownToggle.addEventListener('click', (e) => {
        e.stopPropagation();
        toggleDropdown(dropdownMenu);
        closeDropdown(pendingDropdownMenu);
        document.getElementById('inner-navbar').style.zIndex = -1;
    });

    pendingDropdownToggle.addEventListener('click', (e) => {
        e.stopPropagation();
        toggleDropdown(pendingDropdownMenu);
        closeDropdown(dropdownMenu);
    });

    document.addEventListener('click', (e) => {
        if (!dropdownToggle.contains(e.target)) {
            closeDropdown(dropdownMenu);
        }
        if (!pendingDropdownToggle.contains(e.target)) {
            closeDropdown(pendingDropdownMenu);
        }
    });
});
</script>
