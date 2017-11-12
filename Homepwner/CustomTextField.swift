//
//  CustomTextField.swift
//  Homepwner
//
//  Created by Mark Engen on 11/11/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit
//This class was part of Chapter 14 Silver Challenge
//Need to update the custom class from its default to CustomTextField in the Main.storyboard for it to work
class CustomTextField: UITextField {
    override func becomeFirstResponder() -> Bool {
        borderStyle = .bezel
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        borderStyle = .roundedRect
        return super.resignFirstResponder()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
