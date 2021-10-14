const menu = document.getElementById("menu")
const outstandingBooks = document.getElementById("outstandingBooks")

const noOutsandingBooks = document.getElementById("noOutstandingBooks")
const outstandinbBooksList = document.getElementById("outstandingBooksList")
const outstandingBooksTable = document.getElementById("outstandingBooksTable")

function viewOutstandingBooks() {
    menu.hidden = true
    outstandingBooks.hidden = false
}

function viewMenu() {
    outstandingBooks.hidden = true
    menu.hidden = false
}

let outstandingBooksXHR = new XMLHttpRequest()
outstandingBooksXHR.onload = function() {
    if (this.status === 200) {
        if (this.response.length > 0){
            outstandinbBooksList.hidden = false
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