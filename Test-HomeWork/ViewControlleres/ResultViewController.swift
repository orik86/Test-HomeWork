//
//  ResultViewController.swift
//  Test-HomeWork
//
//  Created by Aleksandr Gazizov on 02/07/2019.
//  Copyright © 2019 Aleksandr Gazizov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var numberTrueAnswer = 0.0
    
    @IBOutlet weak var resultText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        resultText.text = "Правильных ответов \(Int(numberTrueAnswer)) "

    }
}
