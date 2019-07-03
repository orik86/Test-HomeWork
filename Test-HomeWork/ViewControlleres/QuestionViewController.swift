//
//  QuestionViewController.swift
//  Test-HomeWork
//
//  Created by Aleksandr Gazizov on 02/07/2019.
//  Copyright © 2019 Aleksandr Gazizov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multileStackView: UIStackView!
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet var singleButton: [UIButton]!
   
    @IBOutlet var singleLabel: [UILabel]!
    @IBOutlet var myltipleSwitch: [UISwitch]!
    
    var questions: [Questions]!
    var questionIndex = 0
    var countTrueAnswers = 0.0
    var numbersTrueAnswerInQuestion = 0.0
    var trueAnswerInSwitch = 0.0
    
    var currentQuestion: Questions {
        return questions[questionIndex]
    }
    
    var currentAnswers: [Answer] {
        return currentQuestion.answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = Questions.all
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ResultSegue" else { return }
        let destination = segue.destination as! ResultViewController
        destination.numberTrueAnswer = countTrueAnswers
    }
   
    @IBAction func singleButtonClick(_ sender: UIButton) {
        guard let answerIndex = singleButton.firstIndex(of: sender) else { return }
        if currentAnswers[answerIndex].answerTrue == true {
            countTrueAnswers += 1
        }
        nextQuestion()
    }
    
    @IBAction func multiplyButtonClick(_ sender: UIButton) {
        
        for number in 0...currentAnswers.count-1 {
            if currentAnswers[number].answerTrue == true { numbersTrueAnswerInQuestion += 1 }
            if (myltipleSwitch[number].isOn == currentAnswers[number].answerTrue) && (currentAnswers[number].answerTrue == true) {
                trueAnswerInSwitch += 1
            }
        }
        if trueAnswerInSwitch == numbersTrueAnswerInQuestion {
            countTrueAnswers += 1
            numbersTrueAnswerInQuestion = 0.0
            trueAnswerInSwitch = 0.0
        }
        nextQuestion()
    }
    
    
    func updateUI() {
        singleStackView.isHidden = true
        multileStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        navigationItem.title = ("Вопрос № \(questionIndex + 1) из \(questions.count)")
        questionText.text = currentQuestion.quest
        switch currentQuestion.type {
        case .single: updateSingleStack(with: currentAnswers)
        case .multiple: updateMultiplieStack(with: currentAnswers)
            
        }
    }
    
    func updateSingleStack(with answers: [Answer]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButton, answers) {
            button.setTitle(answer.text, for: [])
        }
    }
    
    func updateMultiplieStack(with answers: [Answer]) {
        multileStackView.isHidden = false
        for (label, answer) in zip(singleLabel, answers) {
         label.text = answer.text
        }
        for mpSw in myltipleSwitch {
            mpSw.isOn = false
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex == questions.count {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        } else {
            updateUI()
        }
    }
}
