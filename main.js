const express = require("express")
const session = require("express-session")

// path is a std module that lets us work with file paths
const path = require("path")

// routes is the exported content of the routes.js file, it contains all the handlers for our server
// so that we keep this place clean
const routes = require("./routes/routes")

const PORT = process.env.PORT || 3000 // Use port 3000 unless specified otherwise

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
app.use(express.urlencoded({extended: true}))
app.use(express.json())

// Serve static files
// Allows proper linking of stylesheets to HTML files for example

app.use(express.static(path.join(__dirname, "public")))
app.use(express.static(path.join(__dirname, "public/views")))

//app.get("/", routes.getHome)

//app.get("/addBook", routes.getAddBook)

app.post("/addBook", routes.postAddBook)
app.post("/getBook", routes.getBook)
app.post("/removeBook", routes.removeBook)

app.listen(PORT, () => console.log("Listening on port 3000"))