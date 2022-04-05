import UIKit

/** Day Three  **/


// Arithmetic Operators
let firstScore = 12
let secondScore = 4
let total = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % firstScore


// Operator Overloading
let meaningOfLife = 42
let doubleMeaning = 42 + 42
let fakers = "fakers gonna"
let action = fakers + " fake"
let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatled = firstHalf + secondHalf


// Compound Operators
var score = 95
score -= 5
var quote = "The rain in spain falls mainly on the"
quote += " spaniards"
score *= 5


// Comparison Operators
firstScore == secondScore
firstScore != secondScore
firstScore > secondScore
firstScore <= secondScore
"taylor" >= "swift"


// Conditions
let firstCard = 11
let secondCard = 10
if firstCard + secondCard == 21 {
    print("Blackjack!")
} else if firstCard + secondCard == 2 {
    print("Aces lucky!")
} else {
    print("Regular cards..")
}


// Combining Conditions
let age1 = 12
let age2 = 21
if age1 > 18 && age2 > 18 {
    print("Both are over 18!")
}
if age1 > 18 || age2 > 18 {
    print("At least one is over 18!")
}


// Ternary Operator
print(firstCard == secondCard ? "Cards are the same." : "Cards are different.")


// Switch Statement
let weather = "snow"
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}


// Range Operators
score = 85
switch score {
case 0..<50:
    print("You failed badle.")
case 50..<85:
    print("You did OK.")
    fallthrough // Will also execute next case (in this case, default)
default:
    print("You did great!")
}
