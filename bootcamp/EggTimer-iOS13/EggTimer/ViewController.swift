//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 2, "Medium": 7, "Hard": 12]
    var eggTimer: Timer?
    var countdown: Int?
    var time: Int?
    
    @IBOutlet weak var countDownMinutesLabel: UILabel!
    
    @IBOutlet weak var countdownSecondLabel: UILabel!
    
    @IBOutlet weak var countdownProgressView: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        print(hardness! + ": \(eggTimes[hardness!]!)")
        countdown = eggTimes[hardness!]! * 60
        time = countdown
        
        eggTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            
            let minutes: Int = self.countdown! / 60
            let seconds: Int = self.countdown! % 60
            
            self.countdown! -= 1
            self.countDownMinutesLabel.text = "\(minutes)"
            self.countdownSecondLabel.text = "\(seconds)"
            
            
            self.countdownProgressView.progress = Float(Double(self.countdown!) / Double(self.time!))
            if self.countdown == 0 {
                timer.invalidate()
            }
        })
        
    }
    
}
