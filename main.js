// Load environment variables
require("dotenv").config()

const express = require("express")
const session = require("express-session")

// path is a std module that lets us work with file paths
const path = require("path")

// routes is the exported content of the routes.js file, it contains all the handlers for our server
// so that we keep this place clean
const routes = require("./routes/routes")



// Initialising Express app
const app = express()

// Add the session middleware
// This lets us store data on each user session on the server
app.use(session({
    secret: "secret",       // need to look into secrets, this will do for the moment
    resave: false,
    saveUninitialized: false,
    cookie: {
        maxAge: 60 * 60 * 1000
    } // sessions last one hour max
}))

// Add parsers
// JSON parser might not be necessary for the moment
// URLencoded lets us read the content of the form when users login
app.use(express.urlencoded({ extended: true }))
app.use(express.json())

// Serve static files
// Allows proper linking of stylesheets to HTML files for example

app.use(express.static(path.join(__dirname, "public")))
app.use(express.static(path.join(__dirname, "public/views")))

//app.get("/", routes.getHome)

//app.get("/addBook", routes.getAddBook)
app.get("/isUserLoggedIn", routes.isUserLoggedIn)
app.get("/getBook/:isbn", routes.getBook)
app.get("/isUserAdmin", routes.isUserAdmin)
app.get("/logout", routes.logout)
app.get("/getBorrowedBooks", routes.getBorrowedBooks)

app.post("/addBook", routes.postAddBook)
app.post("/removeBook", routes.removeBook)
app.post("/login", routes.postLogin)
app.post("/register", routes.postRegister)
app.post("/borrowBook", routes.borrowBook)
app.post("/returnBook", routes.returnBook)
app.post("/renewBook", routes.renewBook)


const PORT = process.env.PORT || 3000 // Use port 3000 unless specified otherwise

// Initialising DB client
console.log("Connecting to " + process.env.DB_URI) // changed it to the connection string because it looks cooler hehe
routes.connectToDB()
    .then(() => app.listen(PORT, () => console.log("Done\nListening on port " + PORT)))
    .catch(e => console.log(e))
