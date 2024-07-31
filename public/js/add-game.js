import { initializeApp } from "https://www.gstatic.com/firebasejs/10.4.0/firebase-app.js";
import {
    getStorage,
    ref,
    uploadBytesResumable,
    getDownloadURL,
} from "https://www.gstatic.com/firebasejs/10.4.0/firebase-storage.js";

const firebaseConfig = {
    apiKey: "AIzaSyAtk1ax61BqnaXJWrNAdaQmlg_ZebYYjho",
    authDomain: "dteam-29297.firebaseapp.com",
    projectId: "dteam-29297",
    storageBucket: "dteam-29297.appspot.com",
    messagingSenderId: "352313178490",
    appId: "1:352313178490:web:fffa9647c17fc05fc6bec3",
};

const app = initializeApp(firebaseConfig);
const storage = getStorage(app);

function generateName() {
    var currentDate = new Date();
    var uniqueName = currentDate.getTime();
    return uniqueName.toString();
}

const uploadBlob = (blob) =>
    new Promise((resolve, reject) => {
        const storageRef = ref(storage, `images/${generateName()}`);
        const uploadTask = uploadBytesResumable(storageRef, blob.blob());

        uploadTask.on(
            "state_changed",
            (snapshot) => {
                const progress =
                    (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                console.log("Upload is " + progress + "% done");
            },
            (error) => {
                console.error(error);
                reject(error);
            },
            () => {
                getDownloadURL(uploadTask.snapshot.ref)
                    .then((url) => resolve(url))
                    .catch((error) => {
                        console.error(error);
                        reject(error);
                    });
            }
        );
    });

const txt = document.getElementById("txt");

tinymce.init({
    selector: "textarea.full",
    setup: function (editor) {
        editor.on("click", function () {
            txt.classList.remove("border");
            txt.classList.remove("border-[#C15755]");
        });
    },
    height: 500,
    plugins: ["image", "lists"],
    toolbar:
        "bold italic | alignleft aligncenter " +
        "alignright alignjustify bullist numlist | image",
    menubar: false,
    content_style:
        'body { background-color: #33353b; color:white; font-family: "Poppins", sans-serif; line-height: 1.5; }',
    branding: false,
    statusbar: false,
    resize: false,
    skin: "custom",
    content_css: "custom",
    images_upload_handler: uploadBlob,
});

const priceInput = document.getElementById("price");
const originalPriceInput = document.getElementById("original_price");

priceInput.addEventListener("input", function (e) {
    let value = e.target.value.replace(/[^0-9]/g, "");
    if (value) {
        value = parseInt(value, 10).toLocaleString("id-ID");
        e.target.value = `Rp ${value}`;
        originalPriceInput.value = value.replace(/\./g, "");
    } else {
        e.target.value = "";
        originalPriceInput.value = "";
    }
});

priceInput.addEventListener("keydown", function (e) {
    const allowedKeys = [
        "Backspace",
        "ArrowLeft",
        "ArrowRight",
        "Delete",
        "Tab",
    ];
    if (!allowedKeys.includes(e.key) && isNaN(parseInt(e.key))) {
        e.preventDefault();
    }
});

document.getElementById("video_file").addEventListener("change", function () {
    const file = this.files[0];
    const videoPreview = document.getElementById("videoPreview");
    const videoSource = document.getElementById("videoSource");
    if (file) {
        const fileURL = URL.createObjectURL(file);
        videoSource.src = fileURL;
        videoPreview.classList.remove("hidden");
        videoSource.parentElement.load();
    } else {
        videoPreview.classList.add("hidden");
        videoSource.src = "";
    }
});

document.getElementById("imageButton").addEventListener("click", function () {
    document.getElementById("image_files").click();
});

let allImages = [];

document.getElementById("image_files").addEventListener("change", function () {
    const files = this.files;
    Array.from(files).forEach((file) => {
        allImages.push(file);
    });
    const imagePreview = document.getElementById("imagePreview");
    Array.from(files).forEach((file) => {
        const fileURL = URL.createObjectURL(file);
        const imgDiv = document.createElement("div");
        imgDiv.classList.add("relative", "inline-block");
        imgDiv.innerHTML = `
            <img src="${fileURL}" class="w-56 h-36 object-cover rounded-sm border border-gray-300">
            <button type="button" class="absolute top-1 right-1 bg-white text-black text-xl rounded-full w-6 h-6 flex items-center justify-center remove-image">&times;</button>
            <input type="hidden" name="image_files[]" value="${file.name}">
        `;
        imagePreview.appendChild(imgDiv);

        imgDiv
            .querySelector(".remove-image")
            .addEventListener("click", function () {
                const index = allImages.findIndex(
                    (img) => img.name === file.name
                );
                if (index !== -1) {
                    allImages.splice(index, 1);
                }
                imgDiv.remove();
            });
    });
});

document.querySelectorAll(".remove-image").forEach((button) => {
    button.addEventListener("click", function () {
        button.parentElement.remove();
    });
});

const form = document.getElementById("gameForm");
const submitButton = form.querySelector("button[type='submit']");
const submitText = submitButton.querySelector(".submit-text");
const loader = submitButton.querySelector(".loader");

const uploadImage = (image) =>
    new Promise((resolve, reject) => {
        const storageRef = ref(storage, `images/${generateName()}`);
        const uploadTask = uploadBytesResumable(storageRef, image);

        uploadTask.on(
            "state_changed",
            (snapshot) => {
                const progress =
                    (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                console.log("Upload is " + progress + "% done");
            },
            (error) => {
                console.error(error);
                reject(error);
            },
            () => {
                getDownloadURL(uploadTask.snapshot.ref)
                    .then((url) => resolve(url))
                    .catch((error) => {
                        console.error(error);
                        reject(error);
                    });
            }
        );
    });

const uploadVideo = (video) =>
    new Promise((resolve, reject) => {
        const storageRef = ref(storage, `videos/${generateName()}`);
        const uploadTask = uploadBytesResumable(storageRef, video);

        uploadTask.on(
            "state_changed",
            (snapshot) => {
                const progress =
                    (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                console.log("Upload is " + progress + "% done");
            },
            (error) => {
                console.error(error);
                reject(error);
            },
            () => {
                getDownloadURL(uploadTask.snapshot.ref)
                    .then((url) => resolve(url))
                    .catch((error) => {
                        console.error(error);
                        reject(error);
                    });
            }
        );
    });

form.addEventListener("submit", async (event) => {
    event.preventDefault();
    const btn = document.getElementById("submit-btn");
    btn.disabled = true;
    let videoUrl = "";
    let imageUrl = [];
    const file = document.getElementById("video_file").files[0];

    try {
        loader.classList.remove("hidden");
        submitText.classList.add("hidden");

        if (file) {
            videoUrl = await uploadVideo(file);
        }

        for (const imageFile of allImages) {
            const url = await uploadImage(imageFile);
            imageUrl.push(url);
        }
    } catch (error) {
        console.error("Failed to upload the file and submit the form:", error);
        return;
    } finally {
        if (file) {
            document.getElementById("video_url").value = videoUrl;
        }
        imageUrl.forEach((url) => {
            const input = document.createElement("input");
            input.type = "hidden";
            input.name = `image_urls[]`;
            input.value = url;
            form.appendChild(input);
        });
        loader.classList.add("hidden");
        submitText.classList.remove("hidden");
    }
    form.submit();
});
