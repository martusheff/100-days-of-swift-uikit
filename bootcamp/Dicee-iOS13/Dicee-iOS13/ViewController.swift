//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlet lets me reference a UI element
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // WHO           WHAT    VALUE
        diceImageViewOne.image = #imageLiteral(resourceName: "DiceSix")
        diceImageViewTwo.image = #imageLiteral(resourceName: "DiceTwo")
        
    }


    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        // Dice Asset Name Representation
        let dice = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
        
        // Get 2 Random Numbers
        let randomRollOne = Int.random(in: 0...5)
        let randomRollTwo = Int.random(in: 0...5)
        let rollSum = randomRollOne + randomRollTwo + 2
        
        // Update Dice on UI
        diceImageViewOne.image = UIImage(named: dice[randomRollOne])
        diceImageViewTwo.image = UIImage(named: dice[randomRollTwo])
        
        // Update Rolled Amount on UI

        //print(rollSum)
    }
    
}

