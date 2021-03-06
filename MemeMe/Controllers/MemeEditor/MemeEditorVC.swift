//
//  MemeEditorVC.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 11/11/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit
import Photos

class MemeEditorVC: UIViewController, UINavigationControllerDelegate {
    
    //Mark: view properties and variables
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraPickerButton: UIBarButtonItem!
    @IBOutlet weak var albumPickerButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var shareMemeButton: UIBarButtonItem!
    @IBOutlet weak var cancelMemeEditorButton: UIBarButtonItem!
    @IBOutlet weak var topToolBar: UIToolbar!
    @IBOutlet weak var bottomToolBar: UIToolbar!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var createdMeme: Meme?
    var topIsFirstAttempt = true
    var bottomIsFirstAttempt = true
    var editedMeme: Meme?
    
    //Mark: implementing the rquired view functions
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeApp()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        cameraPickerButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        shouldSubscribeToKeyboardNotifications(should: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        shouldSubscribeToKeyboardNotifications(should: false)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //Mark: UI configuration
    func customizeTextField(textField: UITextField, defaultText: String) {
        setDefaultAttributes(for: textField)
        textField.text! = defaultText
    }
    
    func initializeApp() {
        customizeTextField(textField: topTextField, defaultText: "TOP")
        customizeTextField(textField: bottomTextField, defaultText: "BOTTOM")
        topTextField.delegate = self
        bottomTextField.delegate = self
        shareMemeButton.isEnabled = false
    }
    
    //Mark: MeMe creation
    func saveMeme(){
        createdMeme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imageView.image, memedImage: generateMemedImage())
        appDelegate.memes.append(createdMeme!)
    }
    
    func generateMemedImage() -> UIImage {
        hideToolBars(true)
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        hideToolBars(false)
        return memedImage
    }
    
    func hideToolBars(_ hide: Bool) {
        topToolBar.isHidden = hide
        bottomToolBar.isHidden = hide
    }
    
    // Mark: notificationCenter subscribtion
    func getKeyboardHeight(_ notification: Notification) -> CGFloat{
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    func shouldSubscribeToKeyboardNotifications(should: Bool) {
        if should {
            NotificationCenter.default.addObserver(self, selector: #selector(keyborardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        } else {
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
    
    @objc func keyborardWillShow(_ notification: Notification) {
        if topTextField.isEditing {
            view.frame.origin.y = 0
        } else {
            view.frame.origin.y = -getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    //Mark: IBActions
    @IBAction func pickImage(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sender.tag == 0 ? .photoLibrary : .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func shareMeme(_ sender: Any) {
        saveMeme()
        let activityController = UIActivityViewController(activityItems: [createdMeme!.memedImage!], applicationActivities: nil)
        activityController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if !completed {
                // User canceled
                return
            }
            // User completed activity
        }
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func cancelMemeEditing(_ sender: Any!) {
        self.dismiss(animated: true, completion: nil)
    }
}
