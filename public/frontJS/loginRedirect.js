let xhr = new XMLHttpRequest()
xhr.onload = function (){
    if (this.status === 200) {
        window.location = "/dashboard.html"
    }
}
xhr.open("GET", "/isUserLoggedIn")
xhr.send()