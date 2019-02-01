//
//  SentMemesTableVCViewController.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 01/12/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit

class SentMemesTableVCViewController: UITableViewController {
    
    //Mark: view properties and variables
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var memes = [Meme]()
    
    //Mark: implementing the rquired view functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memes = appDelegate.memes
        tableView.reloadData()
    }
}
