//
//  ViewController.swift
//  Calculator
//
//  Created by Salim Mimouni on 10/05/2016.
//  Copyright © 2016 Salim Mimouni. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var display: UILabel!
    
    var userInterNumbers : Bool = false
    
    var brain = CalculatorBrain()

    @IBAction func appendDigit(sender: UIButton)  {
        let digit  = sender.currentTitle!
        if userInterNumbers {
        display.text = display.text!+digit
            
        } else {
    
            display.text = digit
            userInterNumbers = true
            
        }
        
        
        
    }
    
    @IBAction func operate(sender: UIButton) {
        
        if userInterNumbers {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
 
    
    
    
    @IBAction func enter() {
        userInterNumbers = false
        //print("enter pushed")
        
        if let result =  brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
        
        
        
    }
    
    var displayValue: Double {
        
        get {
            
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
            
        }
        set {
            display.text = "\(newValue)"
            userInterNumbers = false
        }
    }

}

