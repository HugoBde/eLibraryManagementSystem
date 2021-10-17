const menu                      = document.getElementById("menu")
const removeBooks               = document.getElementById("removeBooks")
const outstandingBooks          = document.getElementById("outstandingBooks")
const booksDatabase             = document.getElementById("booksDatabase")
const usersDatabase             = document.getElementById("usersDatabase")
const bookRequestsDatabase      = document.getElementById("bookRequestsDatabase")



const removeBooksLoadingWheel   = document.getElementById("removeBooksLoadingWheel")
const booksLoadingWheel         = document.getElementById("booksLoadingWheel")
const usersLoadingWheel         = document.getElementById("usersLoadingWheel")
const bookRequestsLoadingWheel  = document.getElementById("bookRequestsLoadingWheel")

const modal                     = new bootstrap.Modal(document.getElementById("modal"), {})
const modalBody                 = document.getElementById("modalBody")
const modalRemoveButton         = document.getElementById("modalRemoveButton")

const goodToast                 = new bootstrap.Toast(document.getElementById("goodToast"))
const goodToastMessage          = document.getElementById("goodToastMessage")
const badToast                  = new bootstrap.Toast(document.getElementById("badToast"))
const badToastMessage           = document.getElementById("badToastMessage")

function viewOutstandingBooks() {
    menu.hidden = true
    outstandingBooks.hidden = false
}

function viewMenu() {
    removeBooks.hidden = true
    outstandingBooks.hidden = true
    booksDatabase.hidden = true    
    usersDatabase.hidden = true    
    bookRequestsDatabase.hidden = true        
    menu.hidden = false
}


let users
function viewUsersDatabase() {
    menu.hidden = true
    usersDatabase.hidden = false
    if (users === undefined) {
        usersLoadingWheel.hidden = false
        let xhr = new XMLHttpRequest()
        xhr.onload = function() {
            usersLoadingWheel.hidden = true
            const usersDatabaseTable = document.getElementById("usersDatabaseTable")
            usersDatabaseTable.parentElement.hidden = false
            if (this.status === 200) {
                users = this.response
                for (let user of users) {
                    let item = document.createElement("tr")

                    let id = document.createElement("td")
                    id.innerHTML = user.id

                    let email = document.createElement("td")
                    email.innerHTML = user.email

                    let name = document.createElement("td");
                    name.innerHTML = user.firstname + " " + user.lastname

                    let type = document.createElement("td")
                    type.innerHTML = user.isadmin ? "Admin" : "User"

                    item.appendChild(id)
                    item.appendChild(email)
                    item.appendChild(name)
                    item.appendChild(type)

                    usersDatabaseTable.appendChild(item)
                }
            }
        }
        xhr.responseType = "json"
        xhr.open('GET', '/allUsers')
        xhr.send()
    }
}

let bookRequests
function viewBookRequestsDatabase() {
    menu.hidden = true
    bookRequestsDatabase.hidden = false
    if (bookRequests === undefined) {
        bookRequestsLoadingWheel.hidden = false
        let xhr = new XMLHttpRequest()
        xhr.onload = function() {
            bookRequestsLoadingWheel.hidden = true
            const bookRequestsDatabaseTable = document.getElementById("bookRequestsDatabaseTable")
            bookRequestsDatabaseTable.parentElement.hidden = false
            if(this.status === 200) {
                bookRequests = this.response
                for (let bookRequest of bookRequests) {
                    let item = document.createElement("tr")

                    let isbn = document.createElement("td")
                    isbn.innerHTML = bookRequest.isbn

                    let title = document.createElement("td")
                    title.innerHTML = bookRequest.title

                    let authors = document.createElement("td")
                    for (let author of bookRequest.authors) {
                        authors.innerHTML += author
                    }
                    authors.innerHTML = bookRequest.authors

                    let publisher = document.createElement("td")
                    publisher.innerHTML = bookRequest.publisher.length == 0 ? "N/A" : bookRequest.publisher

                    item.appendChild(isbn)
                    item.appendChild(title)
                    item.appendChild(authors)
                    item.appendChild(publisher)

                    bookRequestsDatabaseTable.appendChild(item)
                }
            }
        }
        xhr.responseType = "json"
        xhr.open("GET", "/allBookRequests")
        xhr.send()
    }
}

let books
function viewBooksDatabase() {
    menu.hidden = true
    booksDatabase.hidden = false
    if (books === undefined) {
        fetchBooks(booksLoadingWheel)
    }
}

function viewRemoveBooks() {
    menu.hidden = true
    removeBooks.hidden = false
    if (books === undefined) {
        fetchBooks(removeBooksLoadingWheel)
    }
}

function fetchBooks(currLoadingWheel) {
    if (books === undefined) {
        currLoadingWheel.hidden = false
        let xhr = new XMLHttpRequest()
        xhr.onload = function() {
            currLoadingWheel.hidden = true
            const bookDatabaseTable = document.getElementById("bookDatabaseTable")
            bookDatabaseTable.parentElement.hidden = false
            const removeBookTable = document.getElementById("removeBookTable")
            removeBookTable.parentElement.hidden = false
            if (this.status === 200) {
                books = this.response
                for (let book of books){
                    // remove books
                    let item = document.createElement("tr")

                    let title = document.createElement("td")
                    title.innerHTML = book.title

                    let removeButton = document.createElement("td")
                    removeButton.innerHTML = "Remove"
                    removeButton.onclick = removeBook(book.title, book.isbn, item)
                    removeButton.classList = "btn btn-danger"

                    item.appendChild(removeButton)
                    item.appendChild(title)

                    removeBookTable.appendChild(item)

                    // books database
                    let dbItem = document.createElement("tr")
                    
                    let isbn = document.createElement("td")
                    isbn.innerHTML = book.isbn
                    let isbn13 = document.createElement("td")
                    isbn13.innerHTML = book.isbn13
                    let dbTitle = document.createElement("td")
                    dbTitle.innerHTML = book.title
                    let authors = document.createElement("td")
                    authors.innerHTML = book.authors
                    let publisher = document.createElement("td")
                    publisher.innerHTML = book.publisher
                    let edition = document.createElement("td")
                    edition.innerHTML = book.edition
                    let date = document.createElement("td")
                    date.innerHTML = book.date
                    let language = document.createElement("td")
                    language.innerHTML = book.language
                    let pages = document.createElement("td")
                    pages.innerHTML = book.pages
                    let availableCopies = document.createElement("td")
                    availableCopies.innerHTML = book.available_copies
                    let totalCopies = document.createElement("td")
                    totalCopies.innerHTML = book.nb_copies

                    dbItem.appendChild(isbn)
                    dbItem.appendChild(isbn13)
                    dbItem.appendChild(dbTitle)
                    dbItem.appendChild(authors)
                    dbItem.appendChild(publisher)
                    dbItem.appendChild(edition)
                    dbItem.appendChild(date)
                    dbItem.appendChild(language)
                    dbItem.appendChild(pages)
                    dbItem.appendChild(availableCopies)
                    dbItem.appendChild(totalCopies)

                    bookDatabaseTable.appendChild(dbItem)
                }
            }
        }
        xhr.responseType = "json"
        xhr.open("GET", "/allBooks")
        xhr.send()
    }
}


// function viewRemoveBooks() {
//     menu.hidden = true
//     removeBooks.hidden = false
//     if (books === undefined) {
//         fetchBooks()
//     }const bookList = document.getElementById("bookList")
//         let xhr = new XMLHttpRequest()
//         xhr.onload = function() {
//             loadingWheel.hidden = true
//             if (this.status === 200) {
//                 for (let book of this.response) {
//                     let item = document.createElement("tr")
//                     let title = document.createElement("td")
//                     title.innerHTML = book.title
//                     let removeButton = document.createElement("td")
//                     removeButton.innerHTML = "Remove"
//                     removeButton.onclick = removeBook(book.title, book.isbn, item)
//                     removeButton.classList = "btn btn-danger"
//                     item.appendChild(removeButton)
//                     item.appendChild(title)
//                     bookList.appendChild(item)
//                 }
//             }
//         }
//         xhr.responseType = 'json'
//         xhr.open('GET', '/allBooks')
//         xhr.send()
//     }
// }

function removeBook(title, isbn, row) {
    return function() {
        modalBody.innerHTML = "Do you really want to remove \"" + title + "\"?"
        modalRemoveButton.onclick = function() {
            modal.hide()
            let xhr = new XMLHttpRequest()
            xhr.onload = function() {
                if (this.status === 201) {
                    row.remove()
                    goodToastMessage.innerHTML = "\"" + title + "\" was successfully removed"
                    goodToast.show()
                } else {
                    badToastMessage.innerHTML = this.response
                    badToast.show()
                }
            }
            xhr.open('POST', "/removeBook")
            xhr.setRequestHeader('Content-Type', 'application/json')
            xhr.send(JSON.stringify({isbn: isbn}))
        }
        modal.show()
    }
}

let outstandingBooksXHR = new XMLHttpRequest()
outstandingBooksXHR.onload = function() {
    const noOutsandingBooks = document.getElementById("noOutstandingBooks")
    const outstandingBooksList = document.getElementById("outstandingBooksList")
    const outstandingBooksTable = document.getElementById("outstandingBooksTable")
    if (this.status === 200) {
        if (this.response.length > 0){
            outstandingBooksList.hidden = false
            noOutsandingBooks.hidden = true
            for(let borrowal of this.response) {
                let row = document.createElement("tr")
                let title = document.createElement("td")
                title.innerHTML = borrowal.title
                let dueDate = document.createElement("td")
                let returnDate = new Date(borrowal.return_date)
                dueDate.innerHTML = `${returnDate.getDate()}/${returnDate.getMonth() + 1}/${returnDate.getFullYear()}`
                let studentName= document.createElement("td")
                studentName.innerHTML = borrowal.firstname + " " + borrowal.lastname
                let studentID= document.createElement("td")
                studentID.innerHTML = borrowal.id
                row.appendChild(title)
                row.appendChild(dueDate)
                row.appendChild(studentName)
                row.appendChild(studentID)
                outstandingBooksTable.appendChild(row)
            }
        }
    }
}
outstandingBooksXHR.responseType = "json"
outstandingBooksXHR.open('GET', '/getOutstandingBooks')
outstandingBooksXHR.send()