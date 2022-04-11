import UIKit

var words: [String] = [String]()

do {
    guard let file = Bundle.main.url(forResource: "words", withExtension: "txt") else { fatalError() }
    let text = try String(contentsOf: file, encoding: String.Encoding.utf8)
words = text.components(separatedBy: "\n")
    
} catch {
    print("Error: Unable to open file.")
}

let count = words.count
let random: String = words[Int.random(in: 0 ..< count)]

print(random)
