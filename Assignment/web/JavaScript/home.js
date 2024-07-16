function toggleLogoutButton() {
    const logoutButton = document.getElementById("logoutButton");
    logoutButton.style.display = logoutButton.style.display === "none" ? "block" : "none";
}

function redirectTo(url) {
    window.location.href = url;
}
