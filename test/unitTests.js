module.exports = [
    isUserLoggedInValid,
    isUserLoggedInInvalid,
    isUserAdminValid,
    isUserAdminInvalid,
    isUserAdminNotLoggedIn,
    loginValid,
    loginWrongEmail,
    loginWrongPassword,
    dataTreatTest,
    addValidBook,
    addBookDoubleUp,
    addBookAsNonAdmin,
    getExistingBook, 
    getNonExistingBook,
    removeExistingBook,
    removeBookAsNonAdmin,
    removeNonExistingBook
]


const routes = require("../routes/routes")
const {Client} = require("pg")

/*
Test function scaffold:
    let results = new TestResult("<name>", "<details>")
    let req = new MyRequest(<additional data if needed>)
    let res = new MyResponse()
    
    
    */
   
   /*function logout(req, res) {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Logout", "Logout should destroy the user object within req.session")
        let req = new MyRequest({})
        req.session = {user: "just pretend this is a user object"}
        let res = new MyResponse()
        res.onEnd = () => {
            if (req.session.user) {
                results.success = false
            } else {
                results.success = true
            }
            resolve(results)
        }
        routes.logout(req, res)
    })
}*/

// Testing isUserLoggedIn

function isUserLoggedInValid() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Is user logged in - Valid", "Response status should be 200 if a user is logged in")
        let req = new MyRequest({})
        req.session = {user: "just pretend this is a user object"}
        let res = new MyResponse()
        res.onEnd = () => {
            if (res.statusCode === 200) {
                results.success = true
            } else {
                results.success = false
            }
            resolve(results)
        }
        routes.isUserLoggedIn(req, res)
    })
}

function isUserLoggedInInvalid() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Is user logged in - Invalid", "Response status should be 400 if a user is not logged in")
        let req = new MyRequest({})
        req.session = {}
        let res = new MyResponse()
        res.onEnd = () => {
            if (res.statusCode === 400) {
                results.success = true
            } else {
                results.success = false
            }
            resolve(results)
        }
        routes.isUserLoggedIn(req, res)
    })
}

// Testing isUserAdmin

function isUserAdminValid() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Is user admin - Valid", "Response status should be 200 if a user is admin")
        let req = new MyRequest({})
        req.session = {user: {
            isAdmin: true
        }}
        let res = new MyResponse()
        res.onEnd = () => {
            if (res.statusCode === 200) {
                results.success = true
            } else {
                results.success = false
            }
            resolve(results)
        }
        routes.isUserAdmin(req, res)
    })
}

function isUserAdminInvalid() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Is user admin - Invalid", "Response status should be 403 if a user is not admin")
        let req = new MyRequest({})
        req.session = {user: {
            isAdmin: false
        }}
        let res = new MyResponse()
        res.onEnd = () => {
            if (res.statusCode === 403) {
                results.success = true
            } else {
                results.success = false
            }
            resolve(results)
        }
        routes.isUserAdmin(req, res)
    })
}

function isUserAdminNotLoggedIn() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Is user admin - Not logged in", "Response status should be 403 if a user is not logged in")
        let req = new MyRequest({})
        req.session = {}
        let res = new MyResponse()
        res.onEnd = () => {
            if (res.statusCode === 403) {
                results.success = true
            } else {
                results.success = false
            }
            resolve(results)
        }
        routes.isUserAdmin(req, res)
    })
}

// Testing postLogin

function loginValid() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Login - Valid", "Logging in with valid credentials should populate req.session with a User object")
        let req = new MyRequest({email: "hugo.m.bouderlique@student.uts.edu.au", password:"qwerty"})
        let res = new MyResponse()
        res.onEnd = () => {
            if (req.session.user) {
                results.success = true
            } else {
                results.success = false
            }
            resolve(results)
        }
        routes.postLogin(req, res)
    })
}

function loginWrongEmail() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Login - Wrong email address", "Logging in with wrong email address should fail to login user and return status 400")
        let req = new MyRequest({email: "badonkadonk@student.uts.edu.au", password:"not the right password boy"})
        let res = new MyResponse()
        res.onEnd = () => {
            if (!req.session.user && res.statusCode === 400) {
                results.success = true
            } else {
                results.success = false
            }
            resolve(results)
        }
        routes.postLogin(req, res)
    })
}

function loginWrongPassword() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Login - Wrong password", "Logging in with wrong password should fail to login user and return status 400")
        let req = new MyRequest({email: "hugo.m.bouderlique@student.uts.edu.au", password:"not the right password boy"})
        let res = new MyResponse()
        res.onEnd = () => {
            if (!req.session.user && res.statusCode === 400) {
                results.success = true
            } else {
                results.success = false
            }
            resolve(results)
        }
        routes.postLogin(req, res)
    })
}

// Testing postAddBook

function addValidBook(client) {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Add book - valid", "Sending a book with appropriate data should return status code 201")
        let req = new MyRequest({
            title: "Test book",
            author: "Test author",
            isbn: "XXXXXXXXXX",
            isbn13: "",
            date: "",
            publisher: "",
            language: "",
            edition: "",
            pages: "69",
            imgURL: ""
        })
        req.session = {
            user: {
                isAdmin: true
            }
        }
        let res = new MyResponse()
        res.onEnd = () => {
            client.query("SELECT * FROM books WHERE isbn='XXXXXXXXXX';")
                .then( output => {
                    if (output.rowCount === 1) {
                        results.success = true
                        client.query("DELETE FROM books WHERE isbn='XXXXXXXXXX';")
                    }
                    resolve(results)
                })
                .catch(err => reject(err))
        }
        routes.postAddBook(req, res)
    })    
}

function addBookDoubleUp() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Add book - Book double up", "Adding a book that is already in the database should return status 422")
        let req = new MyRequest({
            title: "Test book",
            author: "Test author",
            isbn: "0021383553",
            isbn13: "",
            date: "",
            publisher: "",
            language: "",
            edition: "",
            pages: "69",
            imgURL: ""
        })
        req.session = {
            user: {
                isAdmin: true
            }
        }
        let res = new MyResponse()
        res.onEnd = () => {
            if (res.statusCode === 422) {
                results.success = true
            }
            resolve(results)
        }
        routes.postAddBook(req, res)
    })
}

function addBookAsNonAdmin() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Add book - Non admin user", "Adding a book as a non admin user should return status code 403")
        let req = new MyRequest({
            title: "Test book",
            author: "Test author",
            isbn: "0021383553",
            isbn13: "",
            date: "",
            publisher: "",
            language: "",
            edition: "",
            pages: "69",
            imgURL: ""
        })
        req.session = {
            user: {
                isAdmin: false
            }
        }
        let res = new MyResponse()
        res.onEnd = () => {
            if (res.statusCode === 403) {
                results.success = true
            }
            resolve(results)
        }
        routes.postAddBook(req, res)
    })
}

// Testing dataTreat

function dataTreatTest() {
    return new Promise ( (resolve, reject) => {
        let results = new TestResult("Data treat", "Single quotes characters should be doubled to prevent SQL parsing issues")
        let output = routes.dataTreat({
            "key": "value with ' single quotes"
        })
        if (output.key === "value with '' single quotes") {
            results.success = true
        }
        resolve(results)
    })
}

// Testing getBook

function getExistingBook(client) {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Get book - Existing book", "Getting an existing book should return a book object")
        let req = new MyRequest()
        req.params = {isbn: "0021383553"}
        req.session = {
            user: {
                isAdmin: true
            }
        }
        let res = new MyResponse()
        res.onEnd = () => {
            client.query("SELECT * FROM books WHERE isbn='0021383553';")
            .then(output => {
                if (output.rowCount === 1) {
                    let parsedResponse = JSON.parse(res.body)
                    for (let [k,v] of Object.entries(parsedResponse.book)) {
                        if (v !== output.rows[0][k]) {
                            resolve(results)
                        }
                    }
                    results.success = true
                }
                resolve(results)
            })
            .catch(err => reject(err))
        }
        routes.getBook(req, res)
    })
}

function getNonExistingBook() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Get book - Non-existing book", "Attempting to get a book that is not in the database should return status code 404")
        let req = new MyRequest()
        req.params = {isbn: "XXXXXXXXXXXXX"}
        req.session = {
            user: {
                isAdmin: false
            }
        }
        let res = new MyResponse()
        res.onEnd = () => {
            if (res.statusCode === 404) {
                results.success = true
            }
            resolve(results)
        }
        routes.getBook(req, res)
    })
}

// Test Remove book

function removeExistingBook(client) {
    return new Promise( (resolve, rejects) => {
        client.query("INSERT INTO books VALUES ('testISBN', '', '', '', '', '', '{\"\"}', '', '', 0);")
        .then( () => {
            let results = new TestResult("Remove book - Existing book", "Attemption to remove an existing book should remove it from the database")
            let req = new MyRequest({isbn: "testISBN"})
            req.session = {
                user: {
                    isAdmin: true
                }
            }
            let res = new MyResponse()
            res.onEnd = () => {
                client.query("SELECT * FROM books WHERE isbn='testISBN';")
                .then( output => {
                    client.query("DELETE FROM books WHERE isbn='testISBN'") // we try delete the test book no matter what in case the route failed 
                    .then( () => {
                        if (output.rowCount === 0) {
                        results.success = true
                    }
                    resolve(results)
                    })
                })
            }
            routes.removeBook(req, res)
        })
    })
}

function removeBookAsNonAdmin(client) {
    return new Promise( (resolve, rejects) => {
        client.query("INSERT INTO books VALUES ('testISBN2', '', '', '', '', '', '{\"\"}', '', '', 0);")
        .then( () => {
            let results = new TestResult("Remove book - Non admin user", "Non admin user should not be able to remove a book")
            let req = new MyRequest({isbn: "testISBN2"})
            req.session = {
                user: {
                    isAdmin: false  // non admin user
                }
            }
            let res = new MyResponse()
            res.onEnd = () => {
                client.query("SELECT * FROM books WHERE isbn='testISBN2';")
                .then( output => {
                    client.query("DELETE FROM books WHERE isbn='testISBN2'") // we try delete the test book no matter what in case the route failed 
                    .then( () => {
                        if (output.rowCount === 1 && res.statusCode === 403) {
                        results.success = true
                    }
                    resolve(results)
                    })
                })
            }
            routes.removeBook(req, res)
        })
    })
}

function removeNonExistingBook() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Remove book - non existing book", "Attempting to remove a non existing book should return status code 500")
        let req = new MyRequest({isbn: "nonexistingisbn"})
        req.session = {
            user: {
                isAdmin: true
            }
        }
        let res = new MyResponse()
        res.onEnd = () => {
            if (res.statusCode === 500) {
                results.success = true
            }
            resolve(results)
        }
        routes.removeBook(req, res)
    })
}

class TestResult {
    constructor(name, details) {
        this.name = name
        this.details = details
        this.success = false
    }
}

class MyRequest {
    constructor(body) {
        this.body = body
        this.params = {}
        this.session = {}
    }
}

class MyResponse {
    constructor() {
        this.status = function(code) {
            if (this.ended === true) return this
            this.statusCode = code
            return this
        }
        this.ended = false
        this.onEnd = function() {}
        this.end = function() {
            if (this.ended === true) return
            this.ended = true
            this.onEnd()
        }
        this.send = function(chunk) {
            if (this.ended === true) return
            this.body = chunk
            this.end()
        }
        this.redirect = function(location) {
            if (this.ended === true) return
            this.location = location
            this.status(302)
            this.end()
        }
        this.json = function(chunk) {
            this.send(JSON.stringify(chunk))
        }
    }
}
