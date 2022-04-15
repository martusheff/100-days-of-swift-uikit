import UIKit

var greeting = "Hello, playground"

/** Day 11 **/


// Protocols

protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

let user = User(id: "001")
displayID(thing: user)


// Protocol Inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }


// Extensions
extension Int {
    func squared() -> Int {
        return self * self
    }
    var isEven: Bool { return self % 2 == 0 }
}
let number = 8
number.squared()
print(number.squared())
print(number.isEven)


// Protocol Extensions
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        for (index, name) in self.enumerated() {
            print("\(index + 1): \(name)")
        }
    }
}
pythons.summarize()
beatles.summarize()


// Protocol Oriented Programming
protocol Cup {
    var oz: Int { get set }
}

extension Cup {
    func description() {
        print("This cup is \(oz) ounces.")
    }
}

struct Glass: Cup {
    var oz: Int
}

let myNewCup = Glass(oz: 16)
myNewCup.description()
