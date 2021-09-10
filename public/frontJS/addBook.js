// Grab handle on form, good toast and bad toast
// (toasts are the pop up messages that inform the admin of the outcome of the process)
const form = document.getElementById("bookForm")
const goodToast = new bootstrap.Toast(document.getElementById("goodToast"))
const badToast = new bootstrap.Toast(document.getElementById("badToast"))
const errorMessage = document.getElementById("error")



/*
    When form submitted do the following:
    Grab data through FormData, convert the Data to JSON (this lets us use "application/json" as the request content type, rather than "multipart/form-data" which requires a different middleware)
    Disable the default POST request
    POST data to server at /addBook
    Upon receiving the response, display the appropriate toast
*/
form.addEventListener('submit', (event) => {
    let fd = new FormData(form)
    let payload = {}
    for (let p of fd) {
        payload[p[0]] = p[1]
    }

    event.preventDefault();
    
    let xhr = new XMLHttpRequest()
    xhr.onload = function() {
        if (this.status === 201) {
            goodToast.show()
        } else {
            errorMessage.innerHTML = "Could not add book to DB:<br>" + this.response
            badToast.show()
        }
    }
    xhr.open("POST", "/addBook")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.send(JSON.stringify(payload))
});
