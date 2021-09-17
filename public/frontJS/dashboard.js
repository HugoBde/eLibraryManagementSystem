let xhr = new XMLHttpRequest()
xhr.onload = function () {
    if (this.status !== 200) {
        window.location = "/login.html"
    }
}
xhr.open("GET", "/isUserLoggedIn")
xhr.send()