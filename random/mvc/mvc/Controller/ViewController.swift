//
//  ViewController.swift
//  mvc
//
//  Created by andronick martusheff on 4/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = Counter()
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateCount(_ sender: UIButton) {
        counter.updateCount(action: sender.currentTitle!)
        updateUI()
    }
    
    func updateUI() {
        countLabel.text = "\(counter.count)"
    }
}

