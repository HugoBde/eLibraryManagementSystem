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
            bookTitle.innerHTML = book.title

            let bookLink = document.createElement("a")
            bookLink.href = "/book.html?isbn=" + book.isbn

            let bookCover = document.createElement("img")
            bookCover.src = book.image

            let borrowDate = document.createElement("p")
            let date = new Date(book.date_borrowing)
            borrowDate.innerHTML = `Borrow date: ${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`

            let returnDate = document.createElement("p")
            date = new Date(book.return_date)
            returnDate.innerHTML = `Return date: ${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`

            bookLink.appendChild(bookCover)
            item.appendChild(bookTitle)
            item.appendChild(bookLink)
            item.appendChild(borrowDate)
            item.appendChild(returnDate)
            booksList.appendChild(item)
        }
        noBooks.hidden = true
        bookList.hidden = false
    }
}
xhrBorrowedBooks.open("GET", "/getBorrowedBooks")
xhrBorrowedBooks.send()