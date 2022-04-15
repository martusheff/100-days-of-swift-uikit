import UIKit

/** Day 12 **/

// Handling Missing Data
var age: Int? = nil
age = 22
age = nil


// Unwrapping Optionals
var name: String? = nil
name = "martusheff"
if let unwrapped = name {
    print("\(unwrapped.count)")
} else {
    print("Missing name.")
}


// Unwrapping with Guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You did not provide a name!")
        return
    }
    
    print("Hello, \(unwrapped)!")
}
greet("Andronick")


// Force Unwrapping
let str = "5"
let num = Int(str)!
print(num)


// Implicitly Unwrapped Optionals
var height: Int! = nil


// Nil Coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonymous"
print(user)


// Optional Chaining
let names = ["Jonh", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()
print(beatle)


// Optional Try
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
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh!")
}

try checkPassword("secret")
print("OK!")


// Failable Initializers
struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

var p1 = Person(id: "blanket")
var p2 = Person(id: "bleachers")
p1?.id
p2?.id


// Type Casting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()]

pets.forEach { pet in
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
