//
//  ViewController.swift
//  stitch
//
//  Created by andronick martusheff on 4/7/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cookieImageView: UIImageView!
    @IBOutlet weak var secretBunnyImageView: UIImageView!
    @IBOutlet weak var secretMessageLabel: UILabel!
    
    var bites = 1
    var secret = "xoxooxooo"
    var sequence = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func biteButtonTapped(_ sender: UIButton) {
        let cookieToDisplay = bites + 1 > 3 ? 1 : bites + 1
        bites = cookieToDisplay
        cookieImageView.image = UIImage(named: "cookie\(cookieToDisplay)")
        sequence = ""
        secretUnlocked()
        
        
    }
    @IBAction func oSecretButtonTap(_ sender: UIButton) {
        sequence += "o"
        secretUnlocked()
        print(sequence)
    }
    
    @IBAction func xSecretButtonTap(_ sender: UIButton) {
        sequence += "x"
        secretUnlocked()
        print(sequence)
    }
    
    func secretUnlocked() {
        if secret == sequence {
            secretBunnyImageView.alpha = 1.0
            secretMessageLabel.alpha = 1.0
        } else {
            secretBunnyImageView.alpha = 0.0
            secretMessageLabel.alpha = 0.0
        }
    }
}

