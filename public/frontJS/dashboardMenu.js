const menu = document.getElementById("menu")
const books = document.getElementById("books")

const bookList = document.getElementById("booksList")
const noBooks = document.getElementById("noBooks")

function viewBooks () {
    menu.hidden = true
    books.hidden = false
}

function viewMenu() {
    books.hidden = true
    menu.hidden = false
}

let xhrBorrowedBooks = new XMLHttpRequest()
xhrBorrowedBooks.responseType = 'json'
xhrBorrowedBooks.onload = function() {
    if (this.response.books.length !== 0) {
        for (let book of this.response.books) {
            let item = document.createElement("div")
            item.className = "bookListItem"
            let bookTitle = document.createElement("h4")
            let bookLink = document.createElement("a")
            let bookCover = document.createElement("img")
            bookCover.src = book.image
            bookLink.href = "/book.html?isbn=" + book.isbn
            bookLink.appendChild(bookCover)
            bookTitle.innerHTML = book.title
            item.appendChild(bookTitle)
            item.appendChild(bookLink)
            booksList.appendChild(item)
        }
        noBooks.hidden = true
        bookList.hidden = false
    }
}
xhrBorrowedBooks.open("GET", "/getBorrowedBooks")
xhrBorrowedBooks.send()