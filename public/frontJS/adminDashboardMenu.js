const menu = document.getElementById("menu")
const removeBooks = document.getElementById("removeBooks")
const outstandingBooks = document.getElementById("outstandingBooks")

const noOutsandingBooks = document.getElementById("noOutstandingBooks")
const outstandingBooksList = document.getElementById("outstandingBooksList")
const outstandingBooksTable = document.getElementById("outstandingBooksTable")

const loadingWheel = document.getElementById("loadingWheel")

const modal = new bootstrap.Modal(document.getElementById("modal"), {})
const modalBody = document.getElementById("modalBody")
const modalRemoveButton = document.getElementById("modalRemoveButton")

const goodToast = new bootstrap.Toast(document.getElementById("goodToast"))
const goodToastMessage = document.getElementById("goodToastMessage")
const  badToast = new bootstrap.Toast(document.getElementById("badToast"))
const  badToastMessage = document.getElementById("badToastMessage")

let booksLoaded = false
function viewRemoveBooks() {
    menu.hidden = true
    removeBooks.hidden = false
    if (!booksLoaded) {
        loadingWheel.hidden = false
        booksLoaded = true
        const bookList = document.getElementById("bookList")
        let xhr = new XMLHttpRequest()
        xhr.onload = function() {
            loadingWheel.hidden = true
            if (this.status === 200) {
                for (let book of this.response) {
                    let item = document.createElement("tr")
                    let title = document.createElement("td")
                    title.innerHTML = book.title
                    let removeButton = document.createElement("td")
                    removeButton.innerHTML = "Remove"
                    removeButton.onclick = removeBook(book.title, book.isbn, item)
                    removeButton.classList = "btn btn-danger"
                    item.appendChild(removeButton)
                    item.appendChild(title)
                    bookList.appendChild(item)
                }
            }
        }
        xhr.responseType = 'json'
        xhr.open('GET', '/allBooks')
        xhr.send()
    }
}

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
function viewOutstandingBooks() {
    menu.hidden = true
    outstandingBooks.hidden = false
}

function viewMenu() {
    removeBooks.hidden = true
    outstandingBooks.hidden = true
    menu.hidden = false
}

let outstandingBooksXHR = new XMLHttpRequest()
outstandingBooksXHR.onload = function() {
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