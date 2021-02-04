//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by 低调 on 2/3/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcuMethod: String)?
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number  {
            if symbol == "+/-" {
                return n * -1
            }else if symbol == "AC" {
                return 0
            }else if symbol == "%"{
                return n * 0.01
            }else if symbol == "=" {
                return performTwoNumberCalculation(n2 : n)
            }else {
                intermediateCalculation = (n1: n, calcuMethod: symbol)
                
            }
        }

        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let opeartion = intermediateCalculation?.calcuMethod {
            switch opeartion {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Invalid opeartion")
            }
        }
        return nil
    }
}
