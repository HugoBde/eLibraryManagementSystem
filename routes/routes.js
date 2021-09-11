const path = require("path")
const {Client} = require("pg")

let client

async function connectToDB() {
    client = new Client({
        connectionString: process.env.DB_URI,
        ssl: {
            rejectUnauthorized: false
        }
    })
    return client.connect()
}

function postAddBook(req, res) {
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

    let query = `INSERT INTO books VALUES ('${isbn}', '${isbn13}', '${title}', '${imgURL}', '${date}', '${publisher}', '{"${author}"}', '${language}', '${edition}', ${pageInt});`
    client.query(query)
    .then( result => {
        console.log(`${title} added to the database`)
        res.status(201)
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


function getBook(req, res) {
    let {isbn} = req.body

    let query = `SELECT * FROM books WHERE isbn = '${isbn}';`
    client.query(query)
        .then( result => {
            let {rowCount, rows} = result
            if (rowCount === 0) {
                res.status(404).end() // use the right status code
            } else {
                res.json(rows[0])
            }
        })
        .catch( e => {
            console.log(e)
            res.status(500).end()
        })
}

function removeBook(req, res) {
    let {isbn} = req.body
    let query = `DELETE FROM books WHERE isbn='${isbn}';`

    client.query(query)
    .then( result => {
        if (result.rowCount === 1) {
            res.status(201).end()
        } else {
            res.status(500)  // look up the right satus code for that
            res.send("This book might have already been removed")
        }
    })
    .catch( e => {
        console.log(e)
        res.status(500)
        res.send(e.message)
    })
}
module.exports = {
    connectToDB,
    postAddBook,
    getBook,
    removeBook
}