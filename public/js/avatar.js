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
const storageRef = ref(storage, "images");

document
    .getElementById("avatar-input")
    .addEventListener("change", function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById("profile-pic-preview").src =
                    e.target.result;
            };
            reader.readAsDataURL(file);
        }
    });

const form = document.getElementById("avatar-form");
const fileInput = document.getElementById("avatar-input");
const loader = document.getElementById("loader");
const submitText = document.getElementById("submit-text");
const imageUrl = document.getElementById("image-url");

const uploadFile = (file) => {
    return new Promise((resolve, reject) => {
        const path = generateName();
        const fileRef = ref(storageRef, path);
        const uploadTask = uploadBytesResumable(fileRef, file);

        uploadTask.on(
            "state_changed",
            (snapshot) => {},
            (error) => {
                console.error("Upload failed:", error);
                reject(error);
            },
            () => {
                getDownloadURL(uploadTask.snapshot.ref)
                    .then((downloadURL) => {
                        console.log("File available at", downloadURL);
                        resolve(downloadURL);
                    })
                    .catch(reject);
            }
        );
    });
};

form.addEventListener("submit", async (event) => {
    event.preventDefault();

    const file = fileInput.files[0];
    if (file) {
        try {
            loader.classList.remove("hidden");
            submitText.classList.add("hidden");

            const downloadURL = await uploadFile(file);
            imageUrl.value = downloadURL;
        } catch (error) {
            console.error(
                "Failed to upload the file and submit the form:",
                error
            );
            return;
        } finally {
            loader.classList.add("hidden");
            submitText.classList.remove("hidden");
        }
    }

    form.submit();
});

function generateName() {
    var currentDate = new Date();
    var uniqueName = currentDate.getTime();
    return uniqueName.toString();
}
