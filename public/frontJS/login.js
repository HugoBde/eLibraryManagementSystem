function scriptValidation() {
    let form = document.getElementById('form');
    let email = document.getElementById('email').value;
    let text = document.getElementById('text');

    // the regex pattern fails as in the third quantifier {3,5} matches more than 5 letters
    // const pattern = /^[a-zA-Z0-9._-]+@[a-zA-Z]+\.([a-z]{3,5})+\.([a-z]{3})+\.[a-z]{2}$/

    const regex = /^[a-zA-Z0-9\._-]+@((student)|(admin))+\.([a-z]{3})+\.([a-z]{3})+\.[a-z]{2}$/;

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