//
//  UITextFieldExtension.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 01/12/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

extension MemeEditorVC: UITextFieldDelegate {
    
    //Mark: UITextField Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        if topIsFirstAttempt || bottomIsFirstAttempt {
            if textField == topTextField && textField.text! == "TOP" {
                topIsFirstAttempt = false
                textField.text! = ""
            } else if textField == bottomTextField && textField.text! == "BOTTOM"{
                bottomIsFirstAttempt = false
                textField.text! = ""
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
