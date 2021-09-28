const tableBody = document.getElementById('tableBody');
const hideBooks = document.getElementById('returnDisplay')
const shownoBooks = document.getElementById('rBooks')

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
            let fines = document.createElement('td')
            let returnBtn = document.createElement('button');
            let returnBtnTd = document.createElement('td');
            title.innerHTML = book.title
            let date = new Date(book.date_borrowing)
            dateBorrowed.innerHTML = `${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`
            date = new Date(book.return_date)
            dueBy.innerHTML = `${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`
            fines.innerHTML = `N/A`
            returnBtn.innerHTML = "Return"
            returnBtn.classList.add("btn", "btn-danger")
            console.log(book.isbn);
            returnBtn.isbn = book.isbn;
            returnBtn.onclick = returnBook;

            returnBtnTd.appendChild(returnBtn);
            row.appendChild(returnBtnTd)
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