//
//  SentMemesCollectionVC.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 01/12/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit

class SentMemesCollectionVC: UICollectionViewController {
    
    //Mark: view properties and variables
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var memes = [Meme]()
    
    //Mark: implementing the rquired view functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memes = appDelegate.memes
        collectionView.reloadData()
    }
    
    //Mark: UI configuration
    func configureFlowLayout() {
        let space: CGFloat = 3.0
        let dimension = (view.frame.width - 2) / 3
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = dimension
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
}
