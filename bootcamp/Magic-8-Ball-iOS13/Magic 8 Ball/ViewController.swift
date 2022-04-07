//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImageView: UIImageView!
    
    


    @IBAction func askButtonTapped(_ sender: UIButton) {
        let random = Int.random(in: 1...5)
        ballImageView.image = UIImage(named: "ball\(random)")
    }
    
}

