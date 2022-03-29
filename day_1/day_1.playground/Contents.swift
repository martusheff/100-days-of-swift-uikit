import UIKit

// MARK: - Variables

// Variables can vary, and their values can be changed freely.
var str = "Hello, playground"

// Because the variable 'str' has already been declared, we do not have to use the 'var' keyword on it again.
str = "Goobye"

// MARK: - Strings & Integers

var age = 38

// age = "this won't work"

// Above, we are trying to set the age, which has type Int to a string, which will not work because Swift is type safe.

// Large numbers can use underscored as thousand seperators to make the number more readable.
var population = 8_000_000

// MARK: - Multi-line Strings

// str1's final string will have line breaks '\n' on every line break.
var str1 = """
This goes
over multiple
liens
"""

// str2's final string will not have line breaks, and serves as a method of neatly formatting code.
var str2 = """
This goes \
over multiple \
lines
"""

// MARK: - Doubles & Booleans

// 'pi' is of type double as it holds a floating point number
var pi = 3.141

// 'awesome' is a boolean which can hold true/false
var awesome = true

// MARK: - String Interpolation

// 'score' is of type Int and we are using string interpolation to create a string using its value.
var score = 85
var scoreMessage = "Your score was \(score)!"

// I can execute code inline when using string interpolation..
var scoreCurvedMessag = "Your curved score was \(score + 4)!"

// I can also build strings with other build strings using string interpolation.
// NOTE: String interpolation comes with degraded performance when compared to adding strings using "this " + "string"
var results = "The test results are here: \(scoreCurvedMessag)"

// A reason for using string interpolation would be if you are trying to create a string with two or more types where 1 of the types is not a string.

// MARK: - Constants

// Value can be set once, and never changes.
let taylor = "swift"

// taylor = "this won't work"

// I should use let by default unless I know/expect a value I am creating will be changed at some point. XCode will even complain if an unchanged value is not declared as a constant.

// MARK: - Type Annotations

// Here I am using something known as 'type inferencing'. Swift infers the value's type.
let inferredString = "Swift will determine this to be of type String"
let inferredInt = "Same, but an Int"
let inferredBool = false // Same, but a Bool

// Here I am specifically telling the compiler what the type of my declared variables are.
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 6.05
let taylorRocks: Bool = true
