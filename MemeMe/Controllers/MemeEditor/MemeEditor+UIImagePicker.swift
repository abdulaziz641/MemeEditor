//
//  UIImagePickerExtension.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 17/11/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

extension MemeEditorVC: UIImagePickerControllerDelegate {
    
    //Mark: UIImagePicker Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        shareMemeButton.isEnabled = true
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
