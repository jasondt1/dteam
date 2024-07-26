document.addEventListener("DOMContentLoaded", function () {
    const releasedDates = document.querySelectorAll(".released-date");
    releasedDates.forEach((d) => {
        const date = new Date(d.textContent);
        const formattedDate = `${date.getDate()} ${date.toLocaleString(
            "default",
            { month: "short" }
        )}, ${date.getFullYear()}`;
        d.textContent = formattedDate;
    });

    const addedDates = document.querySelectorAll(".added-date");
    addedDates.forEach((d) => {
        const date = new Date(d.textContent);
        const formattedDate = `${date.getDate()}/${
            date.getMonth() + 1
        }/${date.getFullYear()}`;
        d.textContent = formattedDate;
    });
});

let currentGameId = null;
let currentImage = null;
let currentTitle = null;
let currentPrice = null;
let currentOwned = null;
let currentDiscountPercentage = null;
let currentDiscountedPrice = null;

function showAddToCart(
    id,
    image,
    title,
    price,
    owned,
    discount_percentage,
    discounted_price
) {
    if (price.includes(".")) {
        price = price.replace(".", "");
    }
    if (discount_percentage == 0) {
        document.getElementById("modal-game-price").classList.remove("hidden");
        document.getElementById("discount-game-price").classList.add("hidden");
    } else {
        document.getElementById("modal-game-price").classList.add("hidden");
        document
            .getElementById("discount-game-price")
            .classList.remove("hidden");
        document.getElementById(
            "discounted_price"
        ).textContent = `Rp ${parseFloat(discounted_price).toLocaleString(
            "id-ID"
        )}`;
        document.getElementById(
            "discount_percentage"
        ).textContent = `${discount_percentage}%`;
        document.getElementById("price").textContent = `Rp ${parseFloat(
            price
        ).toLocaleString("id-ID")}`;
    }
    if (owned) {
        document.getElementById("owned").classList.remove("hidden");
    } else {
        document.getElementById("owned").classList.add("hidden");
    }
    currentGameId = id;
    currentImage = image;
    currentTitle = title;
    currentPrice = price;
    currentOwned = owned;
    currentDiscountPercentage = discount_percentage;
    currentDiscountedPrice = discounted_price;
    $.ajax({
        url: `/game/data/cart/add/${id}`,
        method: "GET",
        success: function (response) {
            document.getElementById("cartModal").classList.remove("hidden");
            document.getElementById("modal-game-image").src = image;
            document.getElementById("modal-game-title").textContent = title;
            if (price == 0 || price == "Free to Play") {
                document.getElementById("modal-game-price").textContent =
                    "Free to Play";
            } else {
                document.getElementById(
                    "modal-game-price"
                ).textContent = `Rp ${parseFloat(price).toLocaleString(
                    "id-ID"
                )}`;
            }

            const addToCartBtn = document.querySelector(
                `#game-${id} .green-btn`
            );
            if (addToCartBtn) {
                addToCartBtn.outerHTML = `<a href="/cart/show" class="green-btn text-sm py-1.5 px-3 cursor-pointer">In Cart</a>`;
            }
            document.getElementById("cart-count").textContent =
                response.cart_count;
        },
    });
}

function removeCart() {
    if (currentGameId !== null) {
        $.ajax({
            url: `/game/data/cart/remove/${currentGameId}`,
            method: "GET",
            success: function (response) {
                document.getElementById("cartModal").classList.add("hidden");
                const inCartBtn = document.querySelector(
                    `#game-${currentGameId} .green-btn`
                );
                if (inCartBtn) {
                    inCartBtn.outerHTML = `<span class="green-btn text-sm py-1.5 px-3 cursor-pointer" onclick="showAddToCart(${currentGameId}, '${addslashes(
                        document.getElementById("modal-game-image").src
                    )}', '${addslashes(
                        document.getElementById("modal-game-title").textContent
                    )}', '${currentPrice}', '${currentOwned}', '${currentDiscountPercentage}', '${currentDiscountedPrice}')">Add to Cart</span>`;
                }
                currentGameId = null;
                document.getElementById("cart-count").textContent =
                    response.cart_count;
            },
        });
    }
}

function removeWishlist(id) {
    $.ajax({
        url: `/game/data/wishlist/remove/${id}`,
        method: "GET",
        success: function (response) {
            const gameCard = document.getElementById(`game-${id}`);
            if (gameCard) {
                gameCard.style.display = "none";
            }
            if (response.wishlist_count == 0) {
                location.reload();
            }
            document.getElementById("wishlist-count").textContent =
                response.wishlist_count;
        },
    });
}

document.getElementById("continue-btn").addEventListener("click", function () {
    document.getElementById("cartModal").classList.add("hidden");
    currentGameId = null;
    document.getElementById("gift").value = 0;
});

function addslashes(str) {
    return str.replace(/\\/g, "\\\\").replace(/'/g, "\\'").replace(/"/g, '\\"');
}

function updateGift() {
    const isGift = document.getElementById("gift").value;
    $.ajax({
        url: "/cart/update-gift/" + currentGameId + "/" + isGift,
        method: "GET",
        success: function (response) {},
    });
}
