const form = document.getElementById("searchForm")
form.onsubmit = event => {
    event.preventDefault()
    mysearch()
}
const searchResults = document.getElementById("searchResults")
const loadingWheel = document.getElementById("loadingWheel")
const noResults = document.getElementById("noResults")

function mysearch() {
    while (searchResults.firstChild) searchResults.removeChild(searchResults.firstChild)
    noResults.hidden = true
    loadingWheel.hidden = false
    let formData = new FormData(form)
    let searchPayload = {}
    for (let kv of formData) {
        searchPayload[kv[0]] = kv[1]
    }
    let xhr = new XMLHttpRequest()
    xhr.responseType = "json"
    xhr.onload = function() {
        loadingWheel.hidden = true
        if (this.response.length === 0) {
            noResults.hidden = false
        }
        for (let book of this.response) {
            let searchEntry = document.createElement("a")
            searchEntry.href = "/book.html?isbn=" + book.isbn
            searchEntry.classList = "d-flex"
            searchEntry.style.paddingBottom = "1em"

            let img = document.createElement("img")
            img.src = book.image
            img.style.width = "100px"
            img.style.paddingRight = "1em"
            img.alt = book.title

            let data = document.createElement("div")

            if (book.title.length !== 0) {
                let title = document.createElement("h5")
                title.innerHTML = book.title
                data.appendChild(title)
            }

            if (book.authors.length !== 0) {
                let authors = document.createElement("p")
                authors.innerHTML = "By " + book.authors
                data.appendChild(authors)
            }

            if (book.publisher.length !== 0) {
                let publisher = document.createElement("p")
                publisher.innerHTML = book.publisher
                data.appendChild(publisher)
            }

            let date = document.createElement("p")
            date.innerHTML = book.date
            data.appendChild(date)

            searchEntry.appendChild(img)
            searchEntry.appendChild(data)
            searchResults.appendChild(searchEntry)
        }
    }
    xhr.open("POST", "/search")
    xhr.setRequestHeader("Content-Type", "application/json")
    setTimeout(()=> xhr.send(JSON.stringify(searchPayload)), 2000)
}