const book = document.getElementById("book")
const error = document.getElementById("error")

const title = document.getElementById("title")
const authors = document.getElementById("authors")
const bookCover = document.getElementById("bookCover")
const isbn = document.getElementById("isbn")
const isbn13 = document.getElementById("isbn13")
const publisher = document.getElementById("publisher")
const date = document.getElementById("date")
const edition = document.getElementById("edition")
const pages = document.getElementById("pages")

let query = new URLSearchParams(document.location.search).get("isbn")
let payload = {
    isbn: query
}

let xhr = new XMLHttpRequest()
xhr.onload = function () {
    if (this.status === 200) {
        let res = JSON.parse(this.response)
        bookCover.src = res.image
        title.innerHTML += res.title
        isbn.innerHTML += res.isbn
        isbn13.innerHTML += res.isbn13
        publisher.innerHTML += res.publisher
        edition.innerHTML += res.edition
        pages.innerHTML += res.pages
        date.innerHTML += res.date

        for (let author of res.authors) {
            authors.innerHTML += author
        }
    } else {
        book.hidden = true
        error.hidden = false
        // rework this
    }
}
xhr.open("POST", "/getBook")
xhr.setRequestHeader("Content-Type", "application/json")
xhr.send(JSON.stringify(payload))


function removeBook() {
    let xhr = new XMLHttpRequest()
    xhr.open("POST", "/removeBook")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.send(JSON.stringify(payload))
}
