//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Anurag Bhatt on 21/02/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation



struct CalculatorLogic
{
    
   private var number : Double?
    
   private var intermediateCalculation: (op : String , n1 : Double)?
    
    mutating func setNumber(_ number : Double)
    {
        self.number = number
    }
    
    mutating func calculate(symbol : String) -> Double?
    {
        
        if let n = number{
            
            if symbol == "+/-"
            {
                return n * -1
            }
            else if (symbol == "AC")
            {
                return 0
            }
            else if (symbol == "%")
            {
                return n/100
            }
            else if (symbol == "=")
            {
                return performCalculation(n2 : n)
            }
            else
            {
                intermediateCalculation = (op : symbol , n1: n)
            }
        }
        return nil
    }
    
    private func performCalculation(n2 : Double) -> Double?
    {
        if let n1 = intermediateCalculation?.n1,
           let operater = intermediateCalculation?.op
        {
            switch(operater)
            {
            case "+" :
                return n1+n2
                
            case "-" :
                return n1-n2
                
            case"×" :
                return n1*n2
                
            case "÷":
                return n1/n2
                
            default : fatalError("the operator passed does not match any of the symbols ")
                
            }
            
        }
        
        return nil
    }
}

