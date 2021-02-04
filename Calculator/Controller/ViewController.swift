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
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    private var calculator = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            
            if let res = calculator.calculate(symbol: calcMethod) {
                displayValue = res
            }
            
        }

    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let number = sender.currentTitle {
            if isFinishedTypingNumber {
                self.displayLabel.text = number
                isFinishedTypingNumber = false
            }else {
                if number == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + number
            }
        }
    }
}

