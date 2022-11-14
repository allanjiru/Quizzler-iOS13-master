//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateQuestion()
//        progressBar.progress = Float(1) / Float(quiz.count)
    }
    
    

    @IBAction func checkAnswer(_ sender: UIButton) {
        
//        let selectedAnsw = sender.currentTitle!
//        let correctansw = quiz[currentYear].a
//
//        if selectedAnsw == correctansw {
//            sender.backgroundColor = UIColor.green
//        }else {
//            sender.backgroundColor = UIColor.red
//        }
//
//        if(currentYear + 1 < quiz.count){
//            currentYear += 1
//        } else{
//            currentYear = 0
//        }
//
        var buttonColor = quizBrain.checkAnswer(selectedAnsw: sender.currentTitle!)
        
        if buttonColor {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        
        
        
    }
    
    @objc func updateQuestion(){
        questionText.text = quizBrain.getQuestion()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
    
    
    
}

