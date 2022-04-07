import UIKit

/** Day 7 **/


// Using Closures as Parameters When They Accept Parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I have arrived!")
}

travel { (place: String) in
    print("I'm going to " + place + " in my car.")
}

func calculate(action: (Int) -> Int) {
    print("Now calculating the square.")
    action(12)
}

calculate { (num: Int) -> Int in
    print("\(num) squared is: \(num * num)")
    return num * num
}


// Using Closures as Parameters When They Return Values
func dineOut(action: (String) -> String) {
    print("We should eat out!")
    let restaurant = action("Chik'fil A")
    print(restaurant)
    print("Yumm :D lets do it!")
}

dineOut { (suggestion: String) -> String in
    return "How about \(suggestion)?"
}


// Shorthand Parameter Names
func workout(action: (String) -> String) {
    print("Not gonna lie, I don't know what to hit today.")
    let obviously = action("chest")
    print(obviously)
    print("u right lmao")
}

workout { (hit: String) -> String in
    return "Bro you already know it's \(hit) day!"
}

workout { hit -> String in
    return "Bro you already know it's \(hit) day!"
}

workout { hit in
    return "Bro you already know it's \(hit) day!"
}

workout { hit in
    "Bro you already know it's \(hit) day!"
}

workout {
    return "Bro you already know it's \($0) day!"
}


// Closures With Multiple Parameters
func book(action: (String, Int) -> String) {
    print("Book info:")
    let info = action("Day in The Life of Ivan Denisovich", 195)
    print(info)
    print("It's a terrific book!")
}

book {
    "Title - \($0)\nPages - \($1)"
}


// Returning Closures from Functions
func read() -> (String) -> Void {
    return {
        print("I'm reading \($0)")
    }
}
let reading = read()
reading("Warning to the West")
let nextRead = read()("The Soul After Death")


// Capturing Values
func todo() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I have to \($0)")
        counter += 1
    }
}

let today = todo()
today("Study Calculus 3")
today("Complete Udemy Challenge")
today("Task out my User Story for SER316")

