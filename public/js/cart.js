function removeCart(id, gamePrice) {
    $.ajax({
        url: "/game/data/cart/remove/" + id,
        method: "GET",
        success: function (response) {
            const selector = "#" + id;
            $(selector).css("display", "none");
            const price = $("#total-price").text();
            let total = parseInt(price.replace(/[^0-9]/g, ""), 10);
            total = total - gamePrice;
            value = parseInt(total, 10).toLocaleString("id-ID");
            $("#total-price").text("Rp " + value);
            if (response.cart_count == 0) {
                location.reload();
            }
            $("#cart-count").text(response.cart_count);
        },
    });
}

function updateGift(gameId) {
    const isGift = document.getElementById("gift-" + gameId).value;
    $.ajax({
        url: "/cart/update-gift/" + gameId + "/" + isGift,
        method: "GET",
        success: function (response) {},
    });
}

$("#continue-btn").click(function () {
    window.location.href = "/store/show";
});
