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


/* Notes on "Optional" Section for Closures
 
 Closures are hard, but understanding them is not impossible.
 
 A common reason to use a closure would be because I want some work done at some point, but not necessarily right away.
 Ex:
 - Running code after a set delay.
 - Running code after an animation has finished.
 - Running code when a download has finished.
 - Running code when a user selects an option from a menu.
 
 
 
 Why are closure parameters inside the braces?
 
 Below is a simple function.
 func pay(user: String, amount: Int) {
    // some code ...
 }
 
 Below is a closure.
 let payment = { (user: String, amount: Int) in
    // some code ...
 }
 
 One reason to keep the parameters inside the braces is so as to not confuse Swift.
 I can imagine how declaring a closure as ' let myClosue =  (user: String, amount: Int) ' may look like I'm trying to create a tuple.
 Thinking about it, it also makes sense. All of the 'data' the closure contains is essentially being stored in a black of code neatly seperated by the braces.
 
 
 
 Closure that Takes no Parameters but Returns a Value
 
 let payment = { () -> Bool in
    // code ...
 }
 
 The ` () -> Bool ` above is similar to:
 func pay() -> Bool {}
 
 We are signaling the use of a closure, a return value, and not specifying any parameters.
 
 
 
 What's the point?
 Some examples of practical use include:
 
 1) Siri serves as a layer between myself and other applications. When I make a request of Siri, Siri is interacting
    with other applications to return data. Because this data can take time to process, it may appear as though Siri
    has frozen when in reality the request is still being processed. Closures can be used here to slowly update &
    provide feedback to Siri, which is then relayed to the user, so the user knows there was no freeze up.
 
 2) Another good example is how network requests are handled. An iPhone will likely be faster than the network it is
    retrieving & sending data to and from. If a network request will take say 5 seconds to complete, instead of
    waiting on the request to be completed, a closure can be used to execute some desired behavior as a result of the
    request after it was completed. ("Please fetch this data, and when done, run this closure.")
 
 */


func exercise() {
    
    
    let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    //The number of letters in alphabet equals 26
    var myPW = ""
    for _ in 1...6 {
    print(Int.random(in: 1..<100))
        let myRandomIndex = Int.random(in: 1...21322) % 26
        myPW += alphabet[myRandomIndex]
    }
    let password = myPW //Replace this comment with your code.
    
    print(password)
    
    
}

exercise()
