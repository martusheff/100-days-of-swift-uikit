//
//  ViewController.swift
//  stitch
//
//  Created by andronick martusheff on 4/7/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cookieImageView: UIImageView!
    var bites = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func biteButtonTapped(_ sender: UIButton) {
        let cookieToDisplay = bites + 1 > 3 ? 1 : bites + 1
        bites = cookieToDisplay
        cookieImageView.image = UIImage(named: "cookie\(cookieToDisplay)")
    }
    
}

