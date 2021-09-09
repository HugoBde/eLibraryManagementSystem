const path = require("path")

function getHome(req,res) {
    res.sendFile(path.resolve("views/index.html"))
}

module.exports = {
    getHome
}