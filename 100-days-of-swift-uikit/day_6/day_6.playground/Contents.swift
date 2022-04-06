import UIKit

/** Day 6 **/


// Basic Closures
let driving = {
    print("I'm driving in my car.")
}
driving()


// Accepting Parameters in a Closure
let walking = { (place: String) in
    print("I'm going to walk to " + place + ".")
}
walking("London")


// Returning Values from a Closure
let jogging = { (place: String) -> String in
    return "I'm going to jog to " + place + "."
}
let joggingTo = jogging("Starbucks")
print(joggingTo)


// Closures as Parameters
func travel(action: () -> Void) {
    print("I'm getting ready to go!")
    action()
    print("I've arrived!")
}
travel(action: driving)


// Trailing Closure Syntax
// TODO: Look more into Trailing Closure Syntax
travel() {
    print("This is not what the above function does.")
}

