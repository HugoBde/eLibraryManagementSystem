const menu = document.getElementById("menu")
const books = document.getElementById("books")
const fines = document.getElementById("fines")

const bookList = document.getElementById("booksList")
const noBooks = document.getElementById("noBooks")

const noFines = document.getElementById("noFines")
const outstandingBooks = document.getElementById("outstandingBooks")
const noSoonBooks = document.getElementById("noSoonBooks")
const booksDueSoon = document.getElementById("booksDueSoon")

function viewBooks () {
    menu.hidden = true
    books.hidden = false
}

function viewMenu() {
    books.hidden = true
    fines.hidden = true
    menu.hidden = false
}

function viewFines() {
    menu.hidden = true
    fines.hidden = false
}

let xhrBorrowedBooks = new XMLHttpRequest()
xhrBorrowedBooks.responseType = 'json'
xhrBorrowedBooks.onload = function() {
    if (this.response.books.length !== 0) {
        outstandingBooksList = []
        booksDueSoonList = []
        for (let book of this.response.books) {

            // Borrowed books

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

            // Outstanding fines

            let outstandingDays = Math.ceil( (new Date() - date) / 24 / 3600 / 1000 )
            if (outstandingDays > 0) {                  // if book is past due date, list it as outstanding
                let fine
                if (outstandingDays > 5) {
                    fine = 100
                } else {
                    fine = outstandingDays * 5
                }
                outstandingBooksList.push([book, fine])
            } else if (outstandingDays > -6) {          // if the due date is in less than a week, list it as due soon
                booksDueSoonList.push(book)
            }
        }
        noBooks.hidden = true
        bookList.hidden = false

        if (outstandingBooksList.length > 0) {
            outstandingBooks.hidden = false
            noFines.hidden = true
            let table = document.getElementById("outstandingBooksTable")
            for (let [book, fineAmount] of outstandingBooksList) {
                let item = document.createElement("tr")
                let title = document.createElement("td")
                title.innerHTML = book.title
                let fine = document.createElement("td")
                fine.innerHTML = "$"+fineAmount
                item.appendChild(title)
                item.appendChild(fine)
                table.appendChild(item)
            }
        }

        if (booksDueSoonList.length > 0) {
            booksDueSoon.hidden = false
            noSoonBooks.hidden = true
            let table = document.getElementById("booksDueSoonTable")
            for (let book of booksDueSoonList) {
                let item = document.createElement("tr")
                let title = document.createElement("td")
                title.innerHTML = book.title
                let returnDate = document.createElement("td")
                let date = new Date(book.return_date)
                returnDate.innerHTML = `${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`
                item.appendChild(title)
                item.appendChild(returnDate)
                table.appendChild(item)
            }
        }
    }
}
xhrBorrowedBooks.open("GET", "/getBorrowedBooks")
xhrBorrowedBooks.send()