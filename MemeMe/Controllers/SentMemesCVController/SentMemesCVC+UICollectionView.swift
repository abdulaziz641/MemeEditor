//
//  UICollectionViewExtension.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 01/12/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

extension SentMemesCollectionVC: UICollectionViewDelegateFlowLayout {
    
    //Mark: UICollectionViewDelegateFlowLayout Delegate
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCellIdentifier", for: indexPath) as! CollectionViewCell
        let meme = (UIApplication.shared.delegate as! AppDelegate).memes[indexPath.row]
        cell.updateUI(for: meme)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let memeViewer = storyboard?.instantiateViewController(withIdentifier: "MemeView") as! MemeViewerVC
        memeViewer.memedImage = memes[indexPath.row]
        navigationController?.pushViewController(memeViewer, animated: true)
    }
}
