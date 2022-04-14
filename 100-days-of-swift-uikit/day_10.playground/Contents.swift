import UIKit

/** Day 10 **/


// Classes
// Classes never come with a member wise initializer.
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}
let poppy = Dog(name: "Poppy", breed: "Poodle")


// Inheritance
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
    
    override func makeNoise() {
        print("Yip!")
    }
}


// Overriding Methods
let myDog = Poodle(name: "Carl")
myDog.makeNoise()


// Final Classes
// The class below does not allow for child classes/generalizations due to the 'final' keyword.
final class Cat {
    var name: String
    var color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}


// Copying Objects
// Copying structs gives 2 unique objects, classes point to the same object.
class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)
var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)


// Deinitializers
class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name).")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}
for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}


// Mutability
// Classes offer flexible mutability.
let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)
