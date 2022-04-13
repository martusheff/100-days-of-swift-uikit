import UIKit


/** Day 9 **/

// Initializers
struct User {
    var username: String
    
    init() {
        username = "anonymous"
        print("Creating new user...")
    }
    
    func greet() {
        print("Hello, \(username)!")
    }
}
var user = User()
user.greet()
user.username = "martusheff"
user.greet()


// Referring to the Current Instance
struct Person {
    var name: String
    lazy var familyTree = FamilyTree()
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}
var person = Person(name: "Elon Musk")


// Lazy Properties (struct below is used in above Person struct as a lazy loading variable.
struct FamilyTree {
    init() {
        print("Creating family tree.")
    }
}
person.familyTree // Only now will it print the init message.


// Static Properties and Methods
struct Student {
    static var classSize = 0
    var name: String
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
let ed = Student(name: "Ed")
let edd = Student(name: "Edd")
let eddy = Student(name: "Eddy")
// The 'classSize' variable here belongs to the Struct itself and not instance of the struct so we have to use 'Student' to get to it.
print(Student.classSize)


// Access Control
struct Food {
    var name: String
    private var calories: Int
    
    init(name: String, calories: Int) {
        self.name = name
        self.calories = calories
    }
    
    func description() {
        print("\(name) has \(calories) calorie(s) per serving.")
    }
}

let pizza = Food(name: "Pizza", calories: 234)
pizza.description()
