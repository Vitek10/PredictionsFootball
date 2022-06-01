//
//  Utilities.swift
//  Demo predictions
//
//  Created by Витя on 3/24/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    static func styleTextField(_ textfield: UITextField){
        
        let bootomLine = CALayer()
        
        //Create the bootomLine
        bootomLine.frame =  CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bootomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        //Remove border on the textField
        textfield.borderStyle = .none
        //Add the line
        textfield.layer.addSublayer(bootomLine)
    }
    
    static func styleFilledButton(_ button: UIButton){
        
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button: UIButton){
        
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    
       }
    
    static func isPassword(_ password: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
    
}
