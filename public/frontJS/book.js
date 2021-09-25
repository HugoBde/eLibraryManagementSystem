const book = document.getElementById("book")
const error = document.getElementById("error")

const removeBookBtn = document.getElementById("removeBookBtn")
const borrowBookBtn = document.getElementById("borrowBookBtn")

const title = document.getElementById("title")
const authors = document.getElementById("authors")
const bookCover = document.getElementById("bookCover")
const isbn = document.getElementById("isbn")
const isbn13 = document.getElementById("isbn13")
const publisher = document.getElementById("publisher")
const date = document.getElementById("date")
const edition = document.getElementById("edition")
const pages = document.getElementById("pages")
const availableCopies = document.getElementById("availableCopies")

const goodToast = new bootstrap.Toast(document.getElementById("goodToast"))
const goodToastMessage = document.getElementById("goodToastMessage")
const badToast = new bootstrap.Toast(document.getElementById("badToast"))
const badToastErrorMessage = document.getElementById("badToastMessage")

let query = new URLSearchParams(document.location.search).get("isbn")

let copies

let xhr = new XMLHttpRequest()
xhr.responseType = 'json'
xhr.onload = function () {
    if (this.status === 200) {
        bookCover.src = this.response.book.image
        title.innerHTML += this.response.book.title
        isbn.innerHTML += this.response.book.isbn
        isbn13.innerHTML += this.response.book.isbn13
        publisher.innerHTML += this.response.book.publisher
        edition.innerHTML += this.response.book.edition
        pages.innerHTML += this.response.book.pages
        date.innerHTML += this.response.book.date
        availableCopies.innerHTML += this.response.book.available_copies
        copies = this.response.book.available_copies
        console.log(this.response)
        for (let author of this.response.book.authors) {
            authors.innerHTML += author
        }
        if (this.response.isAdmin) {
            removeBookBtn.hidden = false
            borrowBookBtn.hidden = true
        }
        if (this.response.book.available_copies === 0) {
            borrowBookBtn.disabled = true
            borrowBookBtn.title = "No copies available"
            borrowBookBtn.style.pointerEvents = "auto"
            borrowBookBtn.style.cursor = "default"
        }
    } else {
        book.hidden = true
        error.hidden = false
        // rework this
    }
}
xhr.open("GET", "/getBook/" + query)
xhr.send()


function removeBook() {
    let xhr = new XMLHttpRequest()
    xhr.onload = function() {
        if (this.status === 201) {
            goodToast.innerHTML = "Book removed successfully"
            goodToast.show()
        } else {
            badToastErrorMessage.innerHTML = this.response
            badToast.show()
        }
    }
    xhr.open("POST", "/removeBook")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.send(JSON.stringify({isbn: query}))
}

function borrow() {
    if (copies === 0) {
        return
    }
    let xhr = new XMLHttpRequest()
    xhr.onload = function() {
        if (this.status === 201) {
            goodToastMessage.innerHTML = "Book borrowed"
            goodToast.show()
        } else {
            badToastErrorMessage.innerHTML = this.response
            badToast.show()
        }
    }
    xhr.open("POST", "/borrowBook")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.send(JSON.stringify({isbn: query}))
}