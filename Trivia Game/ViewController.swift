//
//  ViewController.swift
//  Trivia Game
//
//  Created by Chicken Nugget on 2019. 07. 18..
//  Copyright © 2019. Nitin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var questions = ["What has holes but can hold water?",
                     "What had three feet but no toes?",
                     "What is tall when its young and short when its old?",
                     "Who spends the day at the window, goes to the table for meals and hides at night?"]
    var currQn = 0
    var answers = ["Sponge", "Yardstick", "Candle", "Fly"]
    var score = 0
    
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var endOfGameMessageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currQn]
    }
    
    @IBAction func checkButtonClick(_ sender: Any) {
        if(userAnswerTextField.text == "")
        {
            validationLabel.text = "Please enter an answer."
            return
        }
        let userAnswer = userAnswerTextField.text
        let correctAnswer = answers[currQn]
        
        if(userAnswer!.caseInsensitiveCompare(correctAnswer)) == .orderedSame
        {
            validationLabel.text = "Correct."
            score += 1
        }
        else
        {
            validationLabel.text = "Incorrect. The correct answer is \(correctAnswer)"
        }
        
        currQn += 1
        if (currQn >= questions.count)
        {
            if(score > questions.count/2)
            {
              endOfGameMessageLabel.text = "Congrats you have finished the game!"
            }
            else
            {
                endOfGameMessageLabel.text = "Better luck next time."
            }
        }  else {
                questionLabel.text = questions[currQn]
        }
        userAnswerTextField.text = ""
            scoreLabel.text = "Score: \(String(score))"

}
}

