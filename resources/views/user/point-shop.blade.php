@extends('layout')

@section('title', 'DTeam :: Point Shop')
@section('css', asset('css/point-shop.css'))

@section('content')
<div class="container min-w-full -mt-5">
    <div class="top-container absolute top-[4.85rem] left-0 w-full mt-1 h-14">
    </div>
    <div class="mt-0.5 flex justify-between" style="z-index: 999">
        <p class="uppercase text-xl font-bold text-[#D9D9D9]">The Points Shop</p>
        <div class="flex gap-2 -mt-1.5 mr-2">
            @if(Auth::user())
            <div class="w-10 h-10">
                <img class="w-full h-full" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/point-logo.png?alt=media&token=336cd5ce-858b-4578-8455-236820455d68" alt="">
            </div>
            <div class="flex flex-col mt-1">
                <p class="uppercase text-[#82A8DD] text-[10px]">Your Balance</p>
                <p class="number tracking-wider text-[#C6CBD7] text-xs">{{Auth::user()->point}}</p>
            </div>
            @endif
        </div>
    </div>
    <div class="-mt-12 hero-section">
        <div class="relative min-w-80 m-auto bg-red-500">
            <img class="w-32 h-32 absolute main-bg" style="left: 50px" src="https://store.akamai.steamstatic.com/public/images/applications/store/coin_single.png?v=e844332c62fc8f734c5f16b40404fd5d" alt="">
            <img class="w-14 h-14 absolute" style="left: -35px; bottom: -110px" src="https://store.akamai.steamstatic.com/public/images/applications/store/csgoChat_128_chickendance.png?v=ce4e554948a5e3175fce773e5525c393" alt="">
            <img class="w-16 h-16 absolute" style="left: -5px; bottom: -115px" src="https://store.akamai.steamstatic.com/public/images/applications/store/bored.png?v=8f96e695dac24b42b3385055a8083a87" alt="">
            <img class="w-20 h-20 absolute" style="left: 25px; bottom: -110px" src="https://store.akamai.steamstatic.com/public/images/applications/store/csgoChat_128_hugs.png?v=6090f9c9c3bd8cb0454b55098bf17b8c" alt="">
            <img class="w-28 h-28 absolute" style="left: 65px; bottom: -120px" src="https://store.akamai.steamstatic.com/public/images/applications/store/happy.png?v=4e35d79400f168ea45958d0f12987156" alt="">
            <img class="w-20 h-20 absolute" style="left: 135px; bottom: -110px" src="https://store.akamai.steamstatic.com/public/images/applications/store/boombox.png?v=13d9f30e1bb9b30809e30e399cd5c6ad" alt="">
            <img class="w-20 h-20 absolute" style="left: 195px; bottom: -115px" src="https://store.akamai.steamstatic.com/public/images/applications/store/dance.png?v=b896bc369ba61bf18e031b94ffb2578a" alt="">
            <img class="absolute" style="left: -5px; bottom: -170px" src="https://store.akamai.steamstatic.com/public/images/applications/store/icons_floor.png?v=cefd19995f94aea287dabbc6903214d6" alt="">
        </div>
        <div class="m-auto -ml-12 w-max">
            <p class="text-2xl tracking-wider font-semibold mt-28 blue-gradient">BUY GAMES, EARN POINTS</p>
            <p class="font-semibold tracking-wider blue-gradient">Customize your Steam experience with Points Shop items</p>
        </div>
    </div>
    <div class="mt-20">
        <p class="text-center mb-2 md:mb-0 md:text-left">Avatars</p>
        <div class="flex gap-3 flex-wrap justify-center md:justify-start">
            @foreach($avatars as $avatar)
            <div class="item-card w-44 h-60 relative cursor-pointer">
                <div class="w-full h-44 flex items-center image-bg"><img loading="lazy" class="w-full" style="border-radius: 5px 5px 0 0" src={{$avatar->image_url}} alt="" onclick="showModal('{{$avatar->id}}', '{{$avatar->name}}' , '{{$avatar->image_url}}', 'background', '{{$avatar->price}}', {{Auth::user() && Auth::user()->item_libraries->contains($avatar->id)}})">
                </div>
                <div class="p-2">
                    <p class="uppercase text-xs text-[#C6CAD6] tracking-wider truncate">{{$avatar->name}}</p>
                    <div class="absolute bottom-2 right-2 tracking-wider text-[#DAE8F0] text-xs flex items-center gap-1">
                    <div class="w-4 h-4 flex">
                        <img class="w-full h-full" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/point-logo.png?alt=media&token=336cd5ce-858b-4578-8455-236820455d68" alt=""></div>
                        <span class="number">{{$avatar->price}}</span>
                    </div>
                    @if(Auth::user() && Auth::user()->item_libraries->contains($avatar->id))
                    <div class="absolute bottom-2 left-2 tracking-wider text-[#DAE8F0] text-xs flex items-center gap-1">
                        <div class="w-4 h-4 flex">
                            <img class="w-full h-full" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Eo_circle_green_checkmark.svg/800px-Eo_circle_green_checkmark.svg.png" alt=""></div>
                    </div>
                    @endif
                </div>
            </div>
            @endforeach
        </div>
    </div>
    <div class="mt-10">
        <p class="text-center mb-2 md:mb-0 md:text-left">Profile Backgrounds</p>
        <div class="flex gap-3 flex-wrap justify-center md:justify-start">
            @foreach($backgrounds as $background)
            <div class="item-card w-44 h-60 relative cursor-pointer" onclick="showBackgroundModal('{{$background->id}}','{{$background->name}}' , '{{$background->image_url}}', 'background', '{{$background->price}}', {{Auth::user() && Auth::user()->item_libraries->contains($background->id)}})">
                <div class="w-full h-44 flex items-center image-bg"><img class="w-full px-2" loading="lazy" src={{$background->image_url}} alt="">
                </div>
                <div class="p-2">
                    <p class="uppercase text-xs text-[#C6CAD6] tracking-wider truncate">{{$background->name}}</p>
                    <div class="absolute bottom-2 right-2 tracking-wider text-[#DAE8F0] text-xs flex items-center gap-1">
                    <div class="w-4 h-4 flex">
                        <img class="w-full h-full" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/point-logo.png?alt=media&token=336cd5ce-858b-4578-8455-236820455d68" alt=""></div>
                        <span class="number">{{$background->price}}</span>
                    </div>
                    @if(Auth::user() && Auth::user()->item_libraries->contains($background->id))
                    <div class="absolute bottom-2 left-2 tracking-wider text-[#DAE8F0] text-xs flex items-center gap-1">
                        <div class="w-4 h-4 flex">
                            <img class="w-full h-full" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Eo_circle_green_checkmark.svg/800px-Eo_circle_green_checkmark.svg.png" alt=""></div>
                    </div>
                    @endif
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>
<div id="avatarModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden text-white">
    <div class="avatar-modal py-8 px-12 overflow-auto h-max items-center">
        <div class="flex flex-col gap-5 my-auto">
            <div class="flex justify-between">
                <p id="avatar-title" class="text-3xl uppercase font-light tracking-wider"></p>
                <div class="flex gap-2 -mt-1.5 mr-2">
                    @if(Auth::user())
                    <div class="w-10 h-10">
                        <img class="w-full h-full" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/point-logo.png?alt=media&token=336cd5ce-858b-4578-8455-236820455d68" alt="">
                    </div>
                    <div class="flex flex-col">
                        <p class="uppercase text-[#82A8DD] text-[12px] font-medium">Your Balance</p>
                        <p class="number tracking-wider text-[#C6CBD7] text-sm">{{Auth::user()->point}}</p>
                    </div>
                    @endif
                </div>
            </div>
            <div class="relative w-3/4 m-auto">
                <img class="w-full" src="https://store.akamai.steamstatic.com/public/images/applications/store/animatedavatar_preview.png?v=0b55c6f7d99d10f9beb2c5b7e5ebceb6" alt="">
                <img id="avatar-image" class="absolute top-[10%] left-[3%] w-[28%] aspect-square" src="" alt="">
                <img id="avatar-image2" class="absolute top-[47%] left-[33%] w-[15%] aspect-square" src="" alt="">
            </div>
            <div class="flex justify-end gap-2" id="avatar-not-owned">
                <div class="flex gap-2">
                    <a id="avatar-purchase-btn" class="purchase-btn text-sm py-3 px-5 cursor-pointer flex items-center gap-1.5">                    <div class="w-5 h-5">
                        <img class="w-full h-full" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/point-logo.png?alt=media&token=336cd5ce-858b-4578-8455-236820455d68" alt="">
                    </div> <span id="avatar-price" class="text-lg tracking-wider"></span></a>
                    <p id="cancel" class="py-3 px-5 cursor-pointer cancel-btn text-lg" onclick="closeModal()">Cancel</p>
                </div>
            </div>
            <div class="flex justify-between gap-2" id="avatar-owned">
                <p class="font-semibold mt-4">You Owned this item.</p>
                <div class="flex gap-2">
                    <a class="green-btn text-sm py-3 px-5 cursor-pointer flex items-center gap-1.5">
                        <span onclick="navigate('/edit-profile/avatar')" class="text-lg tracking-wider ml-1">Edit My Avatar</span>
                    </a>
                    <p id="cancel" class="py-3 px-5 cursor-pointer cancel-btn text-lg" onclick="closeModal()">Cancel</p>
                </div>
            </div>
            <div class="flex justify-between gap-2" id="avatar-insufficient">
                <p class="font-semibold mt-4">Insufficient Points.</p>
                <div class="flex gap-2">
                    <p id="cancel" class="py-3 px-5 cursor-pointer cancel-btn text-lg" onclick="closeModal()">Close</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="backgroundModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden text-white">
    <div class="background-modal py-8 px-12 overflow-auto h-max items-center relative">
        <div class="flex flex-col gap-5 my-auto">
            <div class="flex justify-between">
                <p id="background-title" class="text-3xl uppercase font-light tracking-wider"></p>
                <div class="flex gap-2 -mt-1.5 mr-2">
                    @if(Auth::user())
                    <div class="w-10 h-10">
                        <img class="w-full h-full" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/point-logo.png?alt=media&token=336cd5ce-858b-4578-8455-236820455d68" alt="">
                    </div>
                    <div class="flex flex-col">
                        <p class="uppercase text-[#82A8DD] text-[12px] font-medium">Your Balance</p>
                        <p class="number tracking-wider text-[#C6CBD7] text-sm">{{Auth::user()->point}}</p>
                    </div>
                    @endif
                </div>
            </div>
            <div class="w-[85%] m-auto relative">
                <img class="w-full absolute" style="z-index: 1" src="https://store.akamai.steamstatic.com/public/images/applications/store/background_preview.png?v=5a9bc2bea24a73b7800d442e16c6071e" alt="">
                <img id="background-image" class="w-full absolute top-[0.5rem] px-1" src="" alt="">
            </div>
            <div class="flex justify-end gap-2 mt-[50%]" id="background-not-owned">
                <div class="flex gap-2">
                    <a id="background-purchase-btn" class="purchase-btn text-sm py-3 px-5 cursor-pointer flex items-center gap-1.5">
                        <div class="w-5 h-5">
                            <img class="w-full h-full" src="https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/point-logo.png?alt=media&token=336cd5ce-858b-4578-8455-236820455d68" alt="">
                        </div>
                        <span id="background-price" class="text-lg tracking-wider"></span>
                    </a>
                    <p id="cancel" class="py-3 px-5 cursor-pointer cancel-btn text-lg" onclick="closeBackgroundModal()">Cancel</p>
                </div>
            </div>
            <div class="flex justify-between gap-2 mt-[50%]" id="background-owned">
                <p class="font-semibold mt-4">You Owned this item.</p>
                <div class="flex gap-2">
                    <a class="green-btn text-sm py-3 px-5 cursor-pointer flex items-center gap-1.5">
                        <span onclick="navigate('/edit-profile/background')" class="text-lg tracking-wider ml-1">Edit My Background</span>
                    </a>
                    <p id="cancel" class="py-3 px-5 cursor-pointer cancel-btn text-lg" onclick="closeBackgroundModal()">Close</p>
                </div>
            </div>
            <div class="flex justify-between gap-2 mt-[50%]" id="background-insufficient">
                <p class="font-semibold mt-4">Insufficient Points.</p>
                <div class="flex gap-2">
                    <p id="cancel" class="py-3 px-5 cursor-pointer cancel-btn text-lg" onclick="closeBackgroundModal()">Close</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function showModal(id, title, image, type, price, owned) {
        document.getElementById("avatarModal").classList.remove("hidden");
        document.getElementById("avatar-image").src = image;
        document.getElementById("avatar-image2").src = image;
        document.getElementById("avatar-title").textContent = title;
        document.getElementById("avatar-purchase-btn").href = "/point/purchase/" + id;
        let currentPrice = parseFloat(price);
        let value = parseInt(currentPrice, 10).toLocaleString("en-US");
        document.getElementById("avatar-price").textContent = value + " Points";
        if (owned) {
            document.getElementById("avatar-owned").classList.remove("hidden");
            document.getElementById("avatar-not-owned").classList.add("hidden");
            document.getElementById("avatar-insufficient").classList.add("hidden");
        } else if (!owned && parseInt(price) > {{Auth::user()->point}}) {
            document.getElementById("avatar-insufficient").classList.remove("hidden");
            document.getElementById("avatar-not-owned").classList.add("hidden");
            document.getElementById("avatar-owned").classList.add("hidden");
        } else {
            document.getElementById("avatar-owned").classList.add("hidden");
            document.getElementById("avatar-not-owned").classList.remove("hidden");
            document.getElementById("avatar-insufficient").classList.add("hidden");
        }
    }

    function closeModal() {
        document.getElementById("avatarModal").classList.add("hidden");
    }

    function showBackgroundModal(id, title, image, type, price, owned) {
        document.getElementById("backgroundModal").classList.remove("hidden");
        document.getElementById("background-image").src = image;
        document.getElementById("background-title").textContent = title;
        document.getElementById("background-purchase-btn").href = "/point/purchase/" + id;
        let currentPrice = parseFloat(price);
        let value = parseInt(currentPrice, 10).toLocaleString("en-US");
        document.getElementById("background-price").textContent = value + " Points";
        if (owned) {
            document.getElementById("background-owned").classList.remove("hidden");
            document.getElementById("background-not-owned").classList.add("hidden");
            document.getElementById("background-insufficient").classList.add("hidden");
        } else if (!owned && parseInt(price) > {{Auth::user()->point}}) {
            document.getElementById("background-insufficient").classList.remove("hidden");
            document.getElementById("background-not-owned").classList.add("hidden");
            document.getElementById("background-owned").classList.add("hidden");
        } else {
            document.getElementById("background-owned").classList.add("hidden");
            document.getElementById("background-not-owned").classList.remove("hidden");
            document.getElementById("background-insufficient").classList.add("hidden");
        }
    }


    function closeBackgroundModal(){
        document.getElementById("backgroundModal").classList.add("hidden");
    }
</script>

@endsection

