const path = require("path")
const { Client } = require("pg")
const bcrypt = require("bcrypt")

function User(id, firstName, lastName, email, isAdmin) {
    this.id = id,
    this.firstName = firstName,
    this.lastName = lastName,
    this.email = email,
    this.isAdmin = isAdmin
}

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

function logout(req, res) {
    req.session.destroy()
    res.end()
}

function isUserLoggedIn(req, res) {
    if (req.session.user) {
        res.status(200).end()
    } else {
        res.status(400).end() // find right error code for that
    }
}

function isUserAdmin(req, res) {
    if (req.session.user) {
        if (req.session.user.isAdmin) {
            res.status(200).end()
        }
    }
    res.status(403).end()
}

function postLogin(req, res) {
    let { email, password } = req.body
    let query = `SELECT * FROM users WHERE email = '${email}';`
    client.query(query)
        .then(results => {
            let { rowCount, rows } = results
            if (rowCount !== 1) {
                console.log("Email not found in DB")
                res.status(400).end()                   // look up the right error code
            } else {
                let { id, firstname, lastname, hash, isadmin } = rows[0]
                if (bcrypt.compareSync(password, hash)) {
                    let user = new User(id, firstname, lastname, email, isadmin)
                    console.log("Log in: " + id)
                    req.session.user = user
                    res.redirect("/dashboard.html")
                } else {
                    console.log("User entered the wrong password!")
                    res.status(400).end()               // look up the right error code
                }
            }
        })
        .catch(e => {
            console.log(e)
            res.status(500).end()
        })
}

function postAddBook(req, res) {
    if (!req.session.user || !req.session.user.isAdmin) {
        res.status(403).end()
        return
    }
    let { title, author, isbn, isbn13, date, publisher, language, edition, pages, imgURL } = dataTreat(req.body)

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
        .then(result => {
            console.log(`${title} added to the database`)
            res.status(201)
        })
        .catch(e => {
            console.log(e.message)
            res.status(422).send(e.message)
        })
        .finally(() => res.end())
}

// Might move this function elsewhere later since it isnt a route itself but a helper function to treat SQL queries content
function dataTreat(object) {
    for (let [key, value] of Object.entries(object)) {
        object[key] = value.replace(/'/g, "''")
    }
    return object
}


function getBook(req, res) {
    let { isbn } = req.params
    let isAdmin = false
    if (req.session.user && req.session.user.isAdmin) {
        isAdmin = true
    }
    let query = `SELECT * FROM books WHERE isbn = '${isbn}';`
    client.query(query)
        .then(result => {
            let { rowCount, rows } = result
            if (rowCount === 0) {
                res.status(404).end() // use the right status code
            } else {
                res.json({ book: rows[0], isAdmin: isAdmin })
            }
        })
        .catch(e => {
            console.log(e)
            res.status(500).end()
        })
}

function removeBook(req, res) {
    if (!req.session.user || !req.session.user.isAdmin) {
        res.status(403).send("You sneaky little hacker")
        return
    }
    let { isbn } = req.body
    let query = `DELETE FROM books WHERE isbn='${isbn}';`

    client.query(query)
        .then(result => {
            if (result.rowCount === 1) {
                res.status(201).end()
            } else {
                res.status(500)  // look up the right satus code for that
                res.send("This book might have already been removed")
            }
        })
        .catch(e => {
            console.log(e)
            res.status(500)
            res.send(e.message)
        })
}

function postRegister(req, res) {
    let { id, firstName, lastName, email, password, userType } = req.body
    let isAdmin = (userType === "staff")
    let idInt = Number.parseInt(id)
    if (Number.isNaN(idInt)) {
        res.status(400).send("ID is not a number")
    }
    let hash = bcrypt.hashSync(password, 10)
    let query = `INSERT INTO users VALUES (${id}, '${email}', '${firstName}', '${lastName}', '${hash}', ${isAdmin});`
    client.query(query)
        .then(results => {
            res.status(200).end()
        })
        .catch(e => {
            console.log("Registration: " + e.message)
            if (e.code === '23505') {
                res.status(500).send("User ID already in use")
            } else {
                res.status(500).send("Unknown error")
            }
        })
}

function borrowBook(req, res) {
    if (!req.session.user) {
        res.status(403).send("You are not allowed to borrow this book")
        return
    }
    let { isbn } = req.body
    let today = new Date()
    let day = today.getDate()
    let month = today.getMonth()
    let year = today.getFullYear()
    let todayStr = `${year}-${month + 1}-${day}`
    month++
    if (month === 12) {
        month = 0
        year++
    }
    let returnDateStr = `${year}-${month + 1}-${day}`
    let checkQuery = `SELECT * FROM borrowals WHERE user_id=${req.session.user.id} AND book_isbn = '${isbn}';`
    client.query(checkQuery)
        .then(results => {
            if (results.rowCount !== 0) {
                res.status(403).send("You already have this book borrowed")
                return
            }
        })
        .catch(err => {
            console.log(err.message)
            res.status(510).send("Internal server error, please try again")
        })
    let borrowQuery = `INSERT INTO borrowals VALUES (${req.session.user.id}, '${isbn}', '${todayStr}', '${returnDateStr}');`
    let updateQuery = `UPDATE books SET available_copies = (available_copies - 1) WHERE isbn = '${isbn}';`
    client.query(borrowQuery)
        .then(() => {
            client.query(updateQuery)
                .then(() => {
                    res.status(201).send("Book borrowed")
                })
                .catch(err => {
                    console.log(err.message)
                    let cancelQuery = `DELETE FROM borrowals WHERE book_isbn = '${isbn}';`
                    client.query(cancelQuery)
                    res.status(500).send("An error occured while borrowing the book")
                })
        })
        .catch(err => {
            console.log(err.message)
            res.status(500).send("An error occured while borrowing the book")
        })
}

function getBorrowedBooks(req, res) {
    if (req.session.user) {
        let bookDataQuery = `SELECT books.isbn, books.title, books.image, borrowals.date_borrowing, borrowals.return_date FROM books, borrowals WHERE books.isbn = borrowals.book_isbn AND borrowals.user_id = ${req.session.user.id};`
        client.query(bookDataQuery)
            .then(results => {
                res.json({ books: results.rows })
            })
            .catch(e => console.log(e.message))
    }
}

function returnBook(req, res) {
    if (!req.session.user) {
        res.status(403).end()
        return
    }
    let { isbn } = req.body
    let query = `DELETE FROM borrowals WHERE book_isbn = '${isbn}' AND user_id = ${req.session.user.id};`
    let updateQuery = `UPDATE books SET available_copies = (available_copies + 1) WHERE isbn = '${isbn}';`
    client.query(query)
        .then(() => {
            client.query(updateQuery)
                .then(() => {
                    res.status(201).send("Book return successful")
                })
                .catch(e => {
                    res.status(500).send("An Error occurred")
                })
        })
        .catch(e => {
            res.status(500).send("An Error occurred")
        })

}

function renewBook(req, res) {
    if (!req.session.user) {
        res.status(403).end()
        return
    }
    let {isbn, return_date} = req.body
    let id = req.session.user.id
    let newDate = new Date(return_date)
    newDate.setMonth(newDate.getMonth() + 1)
    newDateStr = `${newDate.getFullYear()}-${newDate.getMonth() + 1}-${newDate.getDate()}`
    let query = `UPDATE borrowals SET return_date = '${newDateStr}' WHERE user_id = ${id} AND book_isbn = '${isbn}';`
    client.query(query)
        .then( () => {
            res.status(200).json(newDate)
        })
        .catch( e => {
            console.log(e)
            res.status(510).end()
        })
}

function search(req, res) {
    let {search, sortBy} = req.body
    let condition = ""
    if (search.trim() !== "") {
        let items = search.split(' ')
        let regex = "("
        for (let item of items) {
            regex += item + "|"
        }
        regex = regex.slice(0, -1)
        regex += ')'
        condition = `WHERE title ~* '${regex}' OR array_to_string(authors, ' ') ~* '${regex}' OR publisher ~* '${regex}' `
    }
    let query = `SELECT * FROM books ${condition} ${sortBy};`
    client.query(query)
        .then( results => {
            res.status(200).json(results.rows)
        })
        .catch(e => {
            console.log(e.message)
            res.status(510).end()
        })
}

module.exports = {
    connectToDB,
    logout,
    isUserLoggedIn,
    isUserAdmin,
    postLogin,
    postAddBook,
    getBook,
    removeBook,
    postRegister,
    getBorrowedBooks,
    borrowBook,
    returnBook,
    renewBook,
    search
}