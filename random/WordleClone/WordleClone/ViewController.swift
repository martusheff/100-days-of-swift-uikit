//
//  ViewController.swift
//  WordleClone
//
//  Created by Andronick Martusheff on 4/12/22.
//

import UIKit

class ViewController: UIViewController {

    var secretWord : String?
    var words: [String] = [String]()
    var guesses: [String] = [String]()
    var count: Int { words.count }
    var currentGuess = 0
    

    @IBOutlet weak var pageTitle: UILabel!
    
    @IBOutlet var guessOneLabels: [UILabel]!
    
    
    @IBOutlet weak var guessTextField: UITextField!
    
    
    @IBOutlet weak var guess1labels: UIStackView!
    
    
    @IBOutlet var guessLabels: [UIStackView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if words.count == 0 { loadWords() }
    }
    
    @IBAction func guessButtonTapped(_ sender: UIButton) {
        print(secretWord)
        guard guessTextField.text!.count == 5 else { return }
        guard secretWord != nil else { return }
        
        let word = guessTextField.text!
        let guess = word.map { String($0).uppercased() }
        let target = secretWord!.map { String($0).uppercased() }
        
        var attempt = guessLabels[currentGuess]
        
        for (index, view) in attempt.subviews.enumerated() {
            var label = (view as? UILabel)!
            label.text = guess[index]
            
            if guess[index] == target[index] {
                label.backgroundColor = UIColor(red: 0.74, green: 0.89, blue: 0.65, alpha: 1.00)
            } else if target.contains(guess[index]) {
                label.backgroundColor = UIColor(red: 1.00, green: 0.99, blue: 0.60, alpha: 1.00)
            }
            label.alpha = 1.0
        }
        
        guessTextField.text = ""
        
        currentGuess += 1
        
    }
    
    func resetGame() {
        currentGuess = 0
        for stack in guessLabels {
            for (_, view) in stack.subviews.enumerated() {
                var label = (view as? UILabel)!
                label.text = "X"
                label.backgroundColor = UIColor(red: 0.76, green: 0.76, blue: 0.76, alpha: 1.00)
                label.alpha = 0.25
            }
        }
    }
    
    // TODO: Add Game Over Logic
    // TODO: Restyle App
    // TODO: Fix Keyboard Overlay Bug
    

    
    @IBAction func playGameButtonTapped(_ sender: UIButton) {
        let randomWord = words[Int.random(in: 0..<words.count)]
        secretWord = randomWord
        resetGame()
    }
    
    func loadWords() {
        do {
            guard let file = Bundle.main.url(forResource: "words", withExtension: "txt") else { fatalError() }
            let text = try String(contentsOf: file, encoding: String.Encoding.utf8)
            words = text.components(separatedBy: "\n")
            
        } catch {
            print("Error: Unable to open file.")
        }
    }
    


}

