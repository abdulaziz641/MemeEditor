//
//  MemeViewerVC.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 04/12/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit

class MemeViewerVC: UIViewController {
    
    //Mark: view properties and variables
    @IBOutlet weak var memedImageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    var memedImage: Meme?
    
    //Mark: implementing the rquired view functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
    }
    
    //Mark: UI configuration
    
    func configureUI() {
        setDefaultAttributes(for: topTextField)
        setDefaultAttributes(for: bottomTextField)
        topTextField.text = memedImage?.topText
        bottomTextField.text = memedImage?.bottomText
        memedImageView.image = memedImage?.originalImage
    }
}
