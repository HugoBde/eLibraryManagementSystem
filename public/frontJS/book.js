const book = document.getElementById("book")
const error = document.getElementById("error")

const removeBookBtn = document.getElementById("removeBookBtn")

const title = document.getElementById("title")
const authors = document.getElementById("authors")
const bookCover = document.getElementById("bookCover")
const isbn = document.getElementById("isbn")
const isbn13 = document.getElementById("isbn13")
const publisher = document.getElementById("publisher")
const date = document.getElementById("date")
const edition = document.getElementById("edition")
const pages = document.getElementById("pages")

const goodToast = new bootstrap.Toast(document.getElementById("goodToast"))
const badToast = new bootstrap.Toast(document.getElementById("badToast"))
const badToastErrorMessage = document.getElementById("removeError")

let query = new URLSearchParams(document.location.search).get("isbn")

let xhr = new XMLHttpRequest()
xhr.onload = function () {
    if (this.status === 200) {
        let res = JSON.parse(this.response)
        bookCover.src = res.book.image
        title.innerHTML += res.book.title
        isbn.innerHTML += res.book.isbn
        isbn13.innerHTML += res.book.isbn13
        publisher.innerHTML += res.book.publisher
        edition.innerHTML += res.book.edition
        pages.innerHTML += res.book.pages
        date.innerHTML += res.book.date

        for (let author of res.book.authors) {
            authors.innerHTML += author
        }
        if (res.isAdmin) {
            removeBookBtn.hidden = false
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
