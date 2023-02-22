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
    
     private var isFinishedTyping : Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        
        if let calcMethod = sender.currentTitle{
            
            calculator.setNumber(displayValue)
            
            
            if let result = calculator.calculate(symbol: calcMethod) {
                
                displayValue = result
                
            }
            
          
        }
        
       
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle
        {
            
            if isFinishedTyping
            {
                displayLabel.text = numValue
                isFinishedTyping = false
            }
            else
            {
                if numValue == "." {
                    if displayLabel.text!.contains(".") {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text!+numValue
            }
        }
        
    
    }

}

