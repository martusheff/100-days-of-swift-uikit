import UIKit


/** Day 5 **/

// Writing Functions
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp wil resize them all into thumbnails.
"""
    print(message)
}
printHelp()


// Accepting Parameters
func square(number: Int) {
    print(number * number)
}
square(number: 8)


// Returning Parameters
func product(num1: Int, num2: Int) -> Int {
    return num1 * num2
}
let result = product(num1: 5, num2: 8)
print(result)


// Parameter Labels
func sayHello(to name: String) {
    print("Hello, " + name)
}
sayHello(to: "Longyue")


// Omitting Parameter Labels
func farewell(_ person: String) {
    print("Goodbye, " + person)
}
farewell("Abbi")


// Default Parameters
func greet(_ person: String, nicely: Bool = true) {
    if nicely {
        print("Hello, " + person)
    } else {
        print("Oh no, it's " + person + " again...")
    }
}
greet("Economic Stability")
greet("Inflation", nicely: false)


// Variadic Functions
print("Just","Win","Baby")

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 5,3,2,5)
square(numbers: 10,9,8,7,6,5,4,3,2,1,0)


// Throwing Functions
enum PasswordError: Error {
    case obvious
}
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}
do {
    try checkPassword("password")
    print("That password will work.")
} catch {
    print("You can't use that password.")
}


// inout Parameters
func doubleInPlace(number: inout Int) {
    number *= 2
}
var myNum = 234
doubleInPlace(number: &myNum)
