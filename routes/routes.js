const { url } = require("inspector")
const path = require("path")
const {Client} = require("pg")

function getHome(req,res) {
    res.sendFile(path.resolve("views/index.html"))
}

function getAddBook(req, res) {
    res.sendFile(path.resolve("views/addBook.html"))
}

async function postAddBook(req, res) {
    let {title, author, isbn, isbn13, date, publisher, language, edition, pages, imgURL} = dataTreat(req.body)
    
    // Ensure given URL is valid, if not, add no URL to DB
    let urlRegex = /^((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?$/
    if (!urlRegex.test(imgURL)) {
        imgURL = ""
    }

    let parse = Number.parseInt(pages)
    let pageInt
    if (Number.isNaN(parse)) {
        pageInt = 0
    } else {
        pageInt = parse
    }

    const client = new Client({database: "elms"})
    await client.connect()
    let query = `INSERT INTO books VALUES ('${isbn}', '${isbn13}', '${title}', '${imgURL}', '${date}', '${publisher}', '{"${author}"}', '${language}', '${edition}', ${pageInt});`
    client.query(query)
    .then( result => {
        console.log(`${title} added to the database`)
        res.status(200)
    })
    .catch( e => {
        console.log(e.message)
        res.status(422).send(e.message)
    })
    .finally(() => res.end())
}

// Might move this function elsewhere later since it isnt a route itself but a helper function to treat SQL queries content
function dataTreat(object) {
    for (let [key, value] of Object.entries(object)) {
        object[key] = value.replace(/'/g,"''")
    }
    return object
}

module.exports = {
    getHome,
    getAddBook,
    postAddBook
}