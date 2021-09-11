function logout() {
    let xhr = new XMLHttpRequest()
    xhr.onload = function (){
        window.location = "/"
    }
    xhr.open("GET", "/logout")
    xhr.send()
}