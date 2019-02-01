//
//  Helper.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 04/12/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

func setDefaultAttributes(for textField: UITextField) {
        textField.defaultTextAttributes = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            .strokeWidth: -5
    ]
    textField.textAlignment = .center
}
