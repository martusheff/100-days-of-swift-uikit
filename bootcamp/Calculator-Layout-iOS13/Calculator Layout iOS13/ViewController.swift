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
    
    var result = 1
    var entry: String = ""
    var entries: [Any] = []
    var operation = Operation.none
    
    enum Operation {
        case addition
        case none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numKeyPressed(_ sender: UIButton) {
        entry += "\(sender.tag)"
        resultLabel.text = entry
    }
    
    
    @IBAction func operationKeyPressed(_ sender: UIButton) {
        entries.append(entry)
        entry = ""
        switch sender.currentTitle {
        case "+":
            entries.append(Operation.addition)
            operation = Operation.addition
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
        entry = ""
        switch operation {
        case .addition:
            let num1: Int = Int(entries[0] as! String) ?? 0
            let num2: Int = Int(entries[2] as! String) ?? 0
            result = num1 + num2
            resultLabel.text = "\(result)"
            
        case .none:
            print("ERROR: No operation selected.")
        }
    }
    
}

