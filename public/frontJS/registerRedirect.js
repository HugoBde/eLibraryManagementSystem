let xhr = new XMLHttpRequest()
xhr.onload = function() {
    if (this.status === 200) {
        window.location = "/"
    }
}
xhr.open("GET", "/isUserLoggedIn")
xhr.send()