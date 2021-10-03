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
            fines.innerHTML = `N/A`
            returnBtn.innerHTML = "Return"
            returnBtn.classList.add("btn", "btn-danger")
            returnBtn.isbn = book.isbn;
            returnBtn.onclick = returnBook;
            returnBtnTd.appendChild(returnBtn);

            renewBtn.innerHTML = "Renew"
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
        console.log(this.response)
    }
    xhr.open("POST", "/returnBook")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.send(JSON.stringify({ isbn: this.isbn }))
    location.reload();
}

function renewBook() {
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