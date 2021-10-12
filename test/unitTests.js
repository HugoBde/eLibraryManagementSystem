module.exports = [
    isUserLoggedInValid,
    isUserLoggedInInvalid,
    isUserAdminValid,
    isUserAdminInvalid,
    isUserAdminNotLoggedIn,
    loginValid,
    loginWrongPassword,
    dataTreatTest
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
        let results = new TestResult("Login - Invalid", "Logging in with wrong password should fail to login user and return status 400")
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

function postAddBook() {
    return new Promise( (resolve, reject) => {
        let results = new TestResult("Add book - valid", "Sending a book with appropriate data should return status code 201")
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





    const testingClient = new Client({
        connectionString: process.env.DB_URI,
        ssl: {
            rejectUnauthorized: false
        }
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

class TestResult {
    constructor(name, details) {
        this.name = name
        this.details = details
        this.success = true
    }
}

class MyRequest {
    constructor(body) {
        this.body = body
        this.session = {}
    }
}

class MyResponse {
    constructor() {
        this.status = function(code) {
            if (this.ended === true) return
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
    }
}
