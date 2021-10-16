const form = document.getElementById("form")

function scriptValidation() {
    let email = document.getElementById('email').value;
    let text = document.getElementById('text');

    // the regex pattern fails as in the third quantifier {3,5} matches more than 5 letters
    // const pattern = /^[a-zA-Z0-9._-]+@[a-zA-Z]+\.([a-z]{3,5})+\.([a-z]{3})+\.[a-z]{2}$/

    const regex = /^[a-zA-Z0-9\._-]+@((student)|(admin)|(staff))+\.([a-z]{3})+\.([a-z]{3})+\.[a-z]{2}$/;

    if (email.match(regex)) {
        form.classList.add("valid");
        form.classList.remove("invalid");
        text.innerHTML = "Your email address is valid";
        text.style.color = "#00FF00";
    }
    else {
        form.classList.remove("valid");
        form.classList.add("invalid");
        text.innerHTML = "Enter a valid email address";
        text.style.color = "red";
    }

    if (email == "") {
        form.classList.remove("valid", "invalid");
        text.innerHTML = "";
    }
}

setInterval(scriptValidation, 100);

const badToast = new bootstrap.Toast(document.getElementById("badToast"))
form.addEventListener('submit', (event) => {
    event.preventDefault();

    // grab data from the form
    let fd = new FormData(form)
    let payload = {}
    for (let p of fd) {
        payload[p[0]] = p[1]
    }

    
    let xhr = new XMLHttpRequest()
    xhr.onload = function() {
        if (this.status === 400) {
            badToast.show()
        } else {
            window.location = this.response
        }
    }
    xhr.open("POST", "/login")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.send(JSON.stringify(payload))
})