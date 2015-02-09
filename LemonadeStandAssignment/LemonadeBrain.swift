//
//  LemonadeBrain.swift
//  LemonadeStandAssignment
//
//  Created by Diego Guajardo on 9/02/2015.
//  Copyright (c) 2015 Guajas Dev. All rights reserved.
//

import Foundation
import UIKit

class LemonadeBrain {
    class func createLemonadeRatio(lemons: Int, iceCubes: Int) -> String {
        
        // Get the lemons to ice cubes ratio
        let lemonadeRatio = Double(lemons) / Double(iceCubes)
        
        // Return the type of lemonade chosen
        if lemonadeRatio < 1.0 {
            return "Diluted"
        } else if lemonadeRatio == 1.0 {
            return "Equal"
        } else {
            return "Acidic"
        }
    }
    
    class func customersToVisitToday(weather: String) -> Int {
        // Get a random value of customers depending on the weather
        
        var randomNumber:Int
        switch weather {
        case "Cold":
            randomNumber = Int(arc4random_uniform(UInt32(8)))
        case "Mild":
            randomNumber = Int(arc4random_uniform(UInt32(10))) + 1
        default:
            randomNumber = Int(arc4random_uniform(UInt32(13))) + 1
        }
        
        return randomNumber
    }
    
    class func customersPaidToday(numberOfCustomers: Int, lemonade: String) -> Array<Bool> {
        
        // Create an array to hold true for customers that paid and false for customers who didin't
        var customerPaid:[Bool] = []
        for var index = 0; index < numberOfCustomers; ++index {
            // Set the preference to be a random number between 0 and 1
            let tastePreference = Float(arc4random()) / Float(UINT32_MAX)
            
            // Return either true or false if the tastePreference corresponds to the lemonade taste
            if tastePreference <= 0.3 {
                if lemonade == "Acidic" {
                    customerPaid.append(true)
                } else {
                    customerPaid.append(false)
                }
            } else if tastePreference <= 0.8 {
                if lemonade == "Equal" {
                    customerPaid.append(true)
                } else {
                    customerPaid.append(false)
                }
            } else if tastePreference <= 1.0 {
                if lemonade == "Diluted" {
                    customerPaid.append(true)
                } else {
                    customerPaid.append(false)
                }
            }
        }
        
        // Return an array with indeces of true for customers that paid and false for those who didnt
        return customerPaid
    }
}