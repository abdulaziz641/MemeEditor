//
//  CollectionViewCell.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 01/12/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //Mark: Cell Properties
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var memedText: UILabel!
    
    //Mark: UI Configuration
    func updateUI(for meme: Meme) {
        memeImage.image = meme.memedImage
        memedText.text = meme.topText
    }
}
