const loginBtn = document.getElementById("loginBtn")
const dashBoardBtn = document.getElementById("dashboardBtn")
const logoutBtn = document.getElementById("logoutBtn")

let xhr = new XMLHttpRequest() 
xhr.onload = function() {
    if (this.status === 200) {
        dashBoardBtn.hidden = false
        logoutBtn.hidden = false 
    } else {
        loginBtn.hidden = false
    }
}
xhr.open("GET", "/isUserLoggedIn")
xhr.send()