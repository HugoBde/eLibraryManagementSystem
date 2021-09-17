const form = document.getElementById("form")
const goodToast = new bootstrap.Toast(document.getElementById("goodToast"))
const badToast = new bootstrap.Toast(document.getElementById("badToast"))
const errorReason = document.getElementById("errorReason")


function register() {
    let formdata = new FormData(form)
    let payload = {}
    for (let kv of formdata) {      // for each key value pair of formdata
        if (kv[1] === "") {
            errorReason.innerHTML = kv[0] + " is needed"
            badToast.show()
            return
        }
        payload[kv[0]] = kv[1]      // Add the pair to payload
    }                               // this lets our request body be application/json instead of multipart/form-data which requires a differnet parser in the backend

    let xhr = new XMLHttpRequest()
    xhr.onload = function() {
        if (this.status === 200) {
            goodToast.show()
        } else {
            errorReason.innerHTML = this.response
            badToast.show()
        }
    }
    xhr.open("POST", "/register")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.send(JSON.stringify(payload))
}