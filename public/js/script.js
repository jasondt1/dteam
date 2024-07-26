const priceInputs = document.querySelectorAll(".price");

priceInputs.forEach((priceInput) => {
    let currentPrice = parseFloat(priceInput.textContent);
    value = parseInt(currentPrice, 10).toLocaleString("id-ID");
    priceInput.textContent = "Rp " + value;
});

const numbers = document.querySelectorAll(".number");

numbers.forEach((number) => {
    let currentPrice = parseFloat(number.textContent);
    value = parseInt(currentPrice, 10).toLocaleString("en-US");
    number.textContent = value;
});

const reviewDates = document.querySelectorAll(".review-date");

reviewDates.forEach((reviewDate) => {
    const timestamp = reviewDate.textContent;
    reviewDate.textContent = formatDate(timestamp);
});

function formatDate(timestamp) {
    const date = new Date(timestamp);
    const months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
    ];

    const day = date.getDate();
    const month = months[date.getMonth()];
    const year = date.getFullYear();

    return `${day} ${month} ${year}`;
}

const searchDates = document.querySelectorAll(".search-date");

searchDates.forEach((searchDate) => {
    const timestamp = searchDate.textContent;
    searchDate.textContent = formatDate2(timestamp);
});

function formatDate2(timestamp) {
    const date = new Date(timestamp);
    const months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
    ];

    const day = date.getDate();
    const month = months[date.getMonth()];
    const year = date.getFullYear();

    return `${day} ${month} ${year}`;
}

function navigate(url) {
    window.location.href = url;
}
