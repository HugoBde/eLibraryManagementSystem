
const routes = require("./routes/routes")
const tests = require("./test/unitTests")

const {Client} = require("pg")
require("dotenv").config()

let testClient = new Client({
    connectionString: process.env.DB_URI,
    ssl: {
        rejectUnauthorized: false
    }
})

async function test() {
    console.error("Testing environment initialised\n")
    console.error("Beginning testing procedure ...");
                   
    console.error(`${tests.length} unit test(s) detected\nRunning unit tests...\n`)
            
    let successfulTests = 0
    let unsuccessfulTests = 0
    let testOutcomes = []
    let failedTests = []
    let failureReason = []

    for (let mytest of tests) {
        let res = mytest(testClient)
        res.then(test => {
            console.error((test.success ? "\033[32mpassed" : "\033[31mfailed") + "\033[0m: " + test.name)
            if (test.success) {
                successfulTests++
            } else {
                unsuccessfulTests++
                failedTests.push(test.name)
                failureReason.push(test.details)
            }
        })
        .catch(err => {
            console.error("\033[31m" + mytest + err.message + "\033[m")
        })
        testOutcomes.push(res)

    }
    Promise.allSettled(testOutcomes)
        .then(results => {
            completedTests = successfulTests + unsuccessfulTests
            console.error("\n" + completedTests + " tests completed\n\033[32m" + successfulTests + " test(s) passed\n\033[31m" + unsuccessfulTests + " test(s) failed\033[0m\n")
            if (completedTests !== tests.length) {
                console.error("\033[31mNumber of tests completed (" + completedTests + ") does not match the number of detected tests (" + tests.length + "), please check the log for errors\033[m")
            }
            if (unsuccessfulTests !== 0) {
                console.error("Failed tests:")
                for (let i = 0; i < unsuccessfulTests; i++) {
                    console.error(`- ${failedTests[i]}: ${failureReason[i]}`)
                }
                process.exit(-1)
            } else {
                process.exit(0)
            }
        })
}

console.error("Initialising test environment...")

const {app} = require("./server")




routes.connectToDB()
.then(() => {
    testClient.connect()
})
.then(() => {
    let server = app.listen(process.env.PORT || 3000)
    test()
})