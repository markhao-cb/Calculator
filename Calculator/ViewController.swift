//
//  ViewController.swift
//  Calculator
//
//  Created by Yu Qi Hao on 6/9/16.
//  Copyright © 2016 Yu Qi Hao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isInTheMiddleOfTyping = false
    
    @IBOutlet private weak var displayLabel: UILabel!
    
    @IBAction private func digitPressed(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isInTheMiddleOfTyping {
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        } else {
            displayLabel.text! = digit
        }
        isInTheMiddleOfTyping = true
    }
    @IBAction private func dotPressed(sender: UIButton) {
        let textCurrentlyInDisplay = displayLabel.text!
        displayLabel.text = textCurrentlyInDisplay + "."
        isInTheMiddleOfTyping = true
    }
    
    private var displayValue : Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        if isInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            isInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
    

}

