import UIKit

/** Day 4 **/

// For Loops
let count = 1...10
for number in count {
    print("Numbr is \(number)")
}
let albums = ["Red", "1989", "Reputation"]
for album in albums {
    print(album + " is on Apple Music")
}
print("Players gonna ")
for _ in 1...5 {
    print("play")
}


// While Loops
var newNumber = 1
while newNumber <= 20 {
    print(newNumber)
    newNumber += 1
}
print("Ready or not, here I come!")


// Repeat Loops
newNumber = 1

repeat {
    print(newNumber)
    newNumber += 1
} while newNumber <= 20
print("Round 2, ready or not, here I come.")

while false {
    print("This won't print.")
}

repeat {
    print("This will print.")
} while false
            

// Exiting Loops
var countDown = 10
while countDown >= 0 {
    print(countDown)
    
    if countDown == 4 {
        print("I'm bored.. let's go now!")
        break
    }
    
    countDown -= 1
}
print("Blast off!")


// Exiting Multiple Loops
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
        
    }
}


// Skipping Items
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}


// Infinite Loops
var counter = 0
while true {
    print(" ")
    counter += 1
    
    if counter == 273 {
        break
    }
}
print("Song over!")

