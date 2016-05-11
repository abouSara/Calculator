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

    @IBAction func appendDigit(sender: UIButton)  {
        let digit  = sender.currentTitle!
        if userInterNumbers {
        display.text = display.text!+digit
            print("digit = \(digit)")
        } else {
    
            display.text = digit
            userInterNumbers = true
            print("digit = \(digit)")
        }
        
        
        
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userInterNumbers {
            enter()
        }
        switch operation {
            
        case "×": performOperation{ $0 * $1 }
        case "÷": performOperation{ $1 / $0 }
        case "+": performOperation{ $0 + $1 }
        case "−": performOperation{ $1 - $0 }
        case "√": performOperation2{ sqrt($0) }
        default:break
        }
    }
    
    func performOperation(operation:(Double,Double)->Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
    }
    func performOperation2(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    func multiply(op1:Double, op2:Double) -> Double {
        return op1*op2
    }
    var operandStack = Array<Double>()
    
    
    @IBAction func enter() {
        userInterNumbers = false
        //print("enter pushed")
        
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
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

