let video = document.getElementById("video-bottom");
let mainVideo = document.getElementById("video-top");
let mainContent = document.getElementById("main-content");
video.currentTime = 10;

function changeVideo() {
    mainVideo.play();
    mainVideo.style.opacity = 1;

    var images = mainContent.getElementsByTagName("img");
    images = Array.prototype.slice.call(images);
    images.forEach(function (image) {
        image.style.opacity = 0;
        setTimeout(function () {
            mainContent.removeChild(image);
        }, 500);
    });
    return;
}

function changeMainImage(imageElement) {
    mainVideo.pause();
    mainVideo.style.opacity = 0;
    mainVideo.classList.remove("active");

    document.querySelectorAll(".img-bottom").forEach((img) => {
        img.classList.remove("selected-img");
    });

    imageElement.classList.add("selected-img");

    if (imageElement.tagName === "VIDEO") {
        mainVideo.play();
        mainVideo.style.opacity = 1;

        var images = mainContent.getElementsByTagName("img");
        images = Array.prototype.slice.call(images);
        images.forEach(function (image) {
            image.style.opacity = 0;
            setTimeout(function () {
                mainContent.removeChild(image);
            }, 500);
        });
        return;
    }

    const newImageUrl = imageElement.src || imageElement.children[0].src;
    const mainImageContainer = document.querySelector(".main-image");
    const newImage = document.createElement("img");
    newImage.src = newImageUrl;
    newImage.alt = "";
    newImage.classList.add("w-full", "crossfade-image");
    mainImageContainer.appendChild(newImage);
    setTimeout(() => {
        newImage.classList.add("active");
        const oldImages = document.querySelectorAll(".crossfade-image");
        setTimeout(() => {
            oldImages.forEach((img) => {
                if (img !== newImage) {
                    img.classList.remove("active");
                }
            });
        }, 100);
    }, 100);
}

const yesButton = document.getElementById("yesBtn");
const noButton = document.getElementById("noBtn");
const recommendInput = document.getElementById("recommend");

function handleVoteButtonClick(event) {
    yesButton.classList.remove("selected");
    noButton.classList.remove("selected");

    event.currentTarget.classList.add("selected");

    if (event.currentTarget === yesButton) {
        recommendInput.value = "1";
    } else if (event.currentTarget === noButton) {
        recommendInput.value = "2";
    }
}

if (yesButton && noButton) {
    yesButton.addEventListener("click", handleVoteButtonClick);
    noButton.addEventListener("click", handleVoteButtonClick);
}

function addWishlist(id) {
    $.ajax({
        url: "/game/data/wishlist/add/" + id,
        method: "GET",
        success: function (response) {
            var button = $(".wishlist-button[data-game-id='" + id + "']");
            button.text("Remove from your wishlist");
            button.attr("onclick", "removeWishlist(" + id + ")");
            $("#wishlist-count").text(response.wishlist_count);
        },
    });
}

function removeWishlist(id) {
    $.ajax({
        url: "/game/data/wishlist/remove/" + id,
        method: "GET",
        success: function (response) {
            var button = $(".wishlist-button[data-game-id='" + id + "']");
            button.text("Add to your wishlist");
            button.attr("onclick", "addWishlist(" + id + ")");
            $("#wishlist-count").text(response.wishlist_count);
        },
    });
}

function showAddToCart(id) {
    $.ajax({
        url: "/game/data/cart/add/" + id,
        method: "GET",
        success: function (response) {
            document.getElementById("cartModal").classList.remove("hidden");
            $("#addCartBtn").replaceWith(
                '<a href="/cart/show" id="inCart" class="green-btn text-sm py-1.5 px-3 cursor-pointer" >In Cart</a>'
            );
            $("#cart-count").text(response.cart_count);
        },
    });
}

function removeCart(id) {
    $.ajax({
        url: "/game/data/cart/remove/" + id,
        method: "GET",
        success: function (response) {
            document.getElementById("cartModal").classList.add("hidden");
            $("#inCart").replaceWith(
                '<span id="addCartBtn" class="green-btn text-sm py-1.5 px-3 cursor-pointer" onclick="showAddToCart(' +
                    id +
                    ')">Add to Cart</span>'
            );
            $("#cart-count").text(response.cart_count);
        },
    });
}

document.getElementById("continue-btn").addEventListener("click", function () {
    document.getElementById("cartModal").classList.add("hidden");
});

function updateGift(gameId) {
    const isGift = document.getElementById("gift-" + gameId).value;
    $.ajax({
        url: "/cart/update-gift/" + gameId + "/" + isGift,
        method: "GET",
        success: function (response) {},
    });
}
