
const routes = require("./routes/routes")
const tests = require("./test/unitTests")

require("dotenv").config()



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
        let res = mytest()
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
            console.error(err.message)
        })
        testOutcomes.push(res)

    }
    Promise.allSettled(testOutcomes)
        .then(results => {
            console.error("\n" + tests.length + " tests completed\n\033[32m" + successfulTests + " test(s) passed\n\033[31m" + unsuccessfulTests + " test(s) failed\033[0m\n")
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




routes.connectToDB().then(() => {
    let server = app.listen(process.env.PORT || 3000)
    test().then(
        () => {
            //server.close(()=> process.exit(0))
        }
    )
})