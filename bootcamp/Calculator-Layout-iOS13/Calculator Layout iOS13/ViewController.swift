//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0.0
    var num1 = 0.0
    var num2 = 0.0
    var entry: String = ""
    var entries: [String] = []
    var operation = Operation.none
    
    enum Operation {
        case addition
        case multiplication
        case subtraction
        case division
        case none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numKeyPressed(_ sender: UIButton) {
        if sender.currentTitle == "." {
            entry += sender.currentTitle ?? ""
        } else {
            entry += "\(sender.tag)"
        }
        resultLabel.text = entry
    }
    
    
    @IBAction func operationKeyPressed(_ sender: UIButton) {
        entries.append(entry)
        entry = ""
        switch sender.currentTitle {
        case "+":
            operation = Operation.addition
        case "-":
            operation = Operation.subtraction
        case "×":
            operation = Operation.multiplication
        case "÷":
            operation = Operation.division
        default:
            print("ERROR: Incorrect Key Press")
        }
        
    }
    
    @IBAction func clearKeyPressed(_ sender: UIButton) {
        result = 0
        entry = ""
        entries = []
        resultLabel.text = "0"
    }
    
    @IBAction func equalKeyPressed(_ sender: UIButton) {
        entries.append(entry)
        guard entries.count == 2 else { return }
        entry = ""
        setEntries()
        
        switch operation {
        case .addition:
            result = num1 + num2
        case .multiplication:
            result = num1 * num2
        case .subtraction:
            result = num1 - num2
        case .division:
            result = num1 / num2
        case .none:
            print("ERROR: No operation selected.")
        }
        resultLabel.text = "\(result)"
        entries.removeAll()
    }
    
    
    
    @IBAction func flipKeyTapped(_ sender: UIButton) {
        guard !entry.isEmpty else { return }
        if entry.first == "-" {
            entry.removeFirst()
        } else {
            entry = "-" + entry
        }
        resultLabel.text = entry
    }
    func setEntries() {
        num1 = Double(entries[0]) ?? 0.0
        num2 = Double(entries[1]) ?? 0.0
    }
    
}

