import UIKit

/** Day 8 **/

// Structs
struct Sport {
    var name: String
}
var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn Tennis"
print(tennis.name)


// Computed Properties
struct Food {
    var name: String
    var isProteinRich: Bool
    
    var foodStatus: String {
        if isProteinRich {
            return "\(name) is protein rich."
        } else {
            return "\(name) is not protein rich."
        }
    }
}
let cookie = Food(name: "Cookie", isProteinRich: false)
print(cookie.foodStatus)


// Property Observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
var progress = Progress(task: "Loading Data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100


// Methods
// Functions inside structs are called methods.
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
let taxRevenue = london.collectTaxes()
print(taxRevenue)


// Mutating Methods
struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anon"
    }
}
var person = Person(name: "Russell")
person.makeAnonymous()
print(person.name)


// Properties and Methods of String
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())
print(string.customMirror)


// Properties and Methods of Arrays
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)
print(toys.capacity)


// Initializers
struct User {
    var username: String
    
    init() {
        username = "Anon"
        print("Creating a new user!")
    }
}
//var user = User(username: "martusheff"
var newUser = User()
newUser.username = "martusheff"


// Referring to the Current Instance
struct Workout {
    var name: String
    
    init(name: String) {
        print("Finished workout: \(name)")
        self.name = name
    }
}
var benchPress = Workout(name: "Bench Press")


// Lazy Properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}
var ray = Person2(name: "Ray")
ray.familyTree


/* Notes
 
 If the struct is constant, the properties are constant.
 A mutating method can change variables of a struct if the struct itself is also a variable.
 A lazy variable is a performance optimization used to delay the creation/loading of a variable until it is needed.
 */
