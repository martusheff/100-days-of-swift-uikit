import UIKit

// Arrays are a collection of values stores into a single value.
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles: [String] = [john, paul, george, ringo]

print(beatles[1])


// Sets are collection of values that arent' sorted in any order, and no item in a set can appear twice.
let colors = Set(["red", "green", "blue"])
let color2 = Set(["red", "red", "green","blue","blue"])



// Tuples let you store multiple values into a single value much like arrays, except items cannot be removed from a tuple, tuples are fixed in size, you can access items by index or set name, and  once a tuple is declared the types of data it contains cannot be changed.
var name = (first: "Taylor", last: "Swift")
name.0 = "Justin"
name.last = "Timberlake"
print(name)



// Arrays vs Sets vs Tuples

// For a specific fixed collection of values: use a tuple.
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville", isResidential: true)
// If you need to see if an item exists in data very quickly, or want all data to be unique: use a set.
let set = Set(["ardvark", "horse","horse","tulip"])
// For a collection that could contain duplicates, and/or the order matters: use an array.
let coolNumbers: [Int] = [1,2,3,4,5,6,7,7,7,8,9,10]




// Dictionaaries

let heights: [String: Double] = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
// Reading a value using a key.
print(heights["Taylor Swift"])

// Default value for dictionary keys where data is unknown.
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Paul"]
favoriteIceCream["Emily", default: "Unknown"]



// Creating Empty Collection

// Swift has built in functionality for initializing empty dictionaries & arrays.
var teams = [String:String]()
teams["Kyle"] = "red"
var results = [Int]()

// Sets can be created empty like this...
var words = Set<String>()
var numbers = Set<Int>()
// Arrays and dictionaries can be creaeted like this as well.
var shapes = Dictionary<String, Int>()
var cities = Array<Int>()




// Enumerations: way of defining groups of related values in a way that makes them easier to use.

let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure


// Associated values give a value additional details/context.

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let bored = Activity.bored
let talking = Activity.talking(topic: "football")


// Raw Values
enum Planet: Int {
    case mercury = 1 // By default, the raw value is set to 0. Putting any other positive integer there will start counting from the set Int.
    case venus
    case earth
    case mars
}
let earth = Planet(rawValue: 3) // Accessing enum case with raw value.
