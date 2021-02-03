//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var isFinishedTypingNumber: Bool = true
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
         isFinishedTypingNumber = true
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let number = sender.currentTitle {
            if isFinishedTypingNumber {
                self.displayLabel.text = number
                isFinishedTypingNumber = false
            }else {
                displayLabel.text = displayLabel.text! + number
            }
        }
    }
}

