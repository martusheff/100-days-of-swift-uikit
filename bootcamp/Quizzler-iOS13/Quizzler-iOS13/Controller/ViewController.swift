//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quizBrain.questionText()
        progressBar.progress = quizBrain.progress()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        
        quizBrain.nextQuestion()
        
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (nil) in
            self.updateUI()
        })
        
        
        
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.questionText()
        progressBar.progress = quizBrain.progress()
        scoreLabel.text = "Score: \(quizBrain.score)"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

