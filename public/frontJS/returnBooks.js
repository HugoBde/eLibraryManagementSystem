const tableBody = document.getElementById('tableBody');
const hideBooks = document.getElementById('returnDisplay')
const shownoBooks = document.getElementById('rBooks')

const goodToast = new bootstrap.Toast(document.getElementById("goodToast"))
const badToast = new bootstrap.Toast(document.getElementById("badToast"))
const goodToastMessage = document.getElementById("goodToastMessage")
const badToastMessage = document.getElementById("badToastMessage")


let xhr = new XMLHttpRequest();
xhr.onload = function () {
    if (this.status === 200) {
        if (this.response.books.length === 0) {
            console.log("hello hugo merci!")
            hideBooks.hidden = true
            shownoBooks.hidden = false
            return
        }
        for (let book of this.response.books) {
            let row = document.createElement('tr')
            let title = document.createElement('td')
            let dateBorrowed = document.createElement('td')
            let dueBy = document.createElement('td')
            dueBy.id = `dueDate${book.isbn}`
            let fines = document.createElement('td')
            let returnBtn = document.createElement('button');
            let renewBtn = document.createElement('button')
            let returnBtnTd = document.createElement('td');
            let renewBtnTd = document.createElement('td');
            title.innerHTML = book.title
            let date = new Date(book.date_borrowing)
            dateBorrowed.innerHTML = `${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`
            date = new Date(book.return_date)
            dueBy.innerHTML = `${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`
            let overdueDays = Math.ceil((new Date() - date) / 3600 / 1000 / 24)
            let fineAmount = "N/A"
            if (overdueDays > 5) {
                fineAmount = "$100"
            } else if (overdueDays > 0) {
                fineAmount = "$" + (overdueDays * 5)
            }
            fines.innerHTML = fineAmount
            returnBtn.innerHTML = "Return"
            returnBtn.classList.add("btn", "btn-danger")
            returnBtn.isbn = book.isbn;
            returnBtn.onclick = returnBook;
            returnBtnTd.appendChild(returnBtn);

            renewBtn.innerHTML = "Renew"
            if (book.renewed) {
                renewBtn.disabled = true
                renewBtn.title = "This book has already been renewed"
                renewBtn.style.pointerEvents = "all"
                renewBtn.style.cursor = "default"
            } else if (overdueDays > 0) {
                renewBtn.disabled = true
                renewBtn.title = "You cannot renew an overdue book"
                renewBtn.style.pointerEvents = "all"
                renewBtn.style.cursor = "default"
            }
            renewBtn.classList.add("btn", "btn-success")
            renewBtn.isbn = book.isbn
            renewBtn.returnDate = book.return_date
            renewBtn.onclick = renewBook
            renewBtnTd.appendChild(renewBtn);

            row.appendChild(returnBtnTd)
            row.appendChild(renewBtnTd)
            row.appendChild(title)
            row.appendChild(dateBorrowed)
            row.appendChild(dueBy)
            row.appendChild(fines)
            tableBody.appendChild(row)

        }
    }
}
xhr.responseType = "json";
xhr.open("GET", "/getBorrowedBooks");
xhr.send();

function returnBook() {
    let xhr = new XMLHttpRequest()
    xhr.onload = function () {
        if (this.status === 201) {
            goodToastMessage.innerHTML = this.response
            goodToast.show()
            this.button.parentElement.parentElement.parentElement.removeChild(this.button.parentElement.parentElement)  
        } else {
            badToastMessage.innerHTML = this.response
            badToast.show()
        }
    }
    xhr.button = this
    xhr.open("POST", "/returnBook")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.send(JSON.stringify({ isbn: this.isbn }))
}

function renewBook() {
    this.disabled = true
    let td = document.getElementById(`dueDate${this.isbn}`)
    let xhr = new XMLHttpRequest()
    xhr.responseType = 'json'
    xhr.onload = function() {
        if (this.status === 200) {
            goodToastMessage.innerHTML = "Book rental has been renewed"
            goodToast.show()
            let newDate = new Date(this.response)
            let newDateStr = `${newDate.getDate()}/${newDate.getMonth() + 1}/${newDate.getFullYear()}`
            td.innerHTML = newDateStr
            td.style.color = "darkgreen"
            setTimeout( () => td.style.color = "black", 5000)
        } else {
            badToastMessage.innerHTMl = "Book rental could not be renewed"
            badToast.show()
        }
    }
    xhr.open("POST", "/renewBook")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.send(JSON.stringify({
        isbn: this.isbn,
        return_date: this.returnDate
    }))
}