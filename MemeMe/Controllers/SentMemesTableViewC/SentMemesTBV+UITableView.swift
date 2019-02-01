//
//  SentMemesTBV+UITableView.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 01/12/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

extension SentMemesTableVCViewController {
    
    //Mark: UITableView Implementation
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellIdentifier") as! TableViewCell
        let meme = (UIApplication.shared.delegate as! AppDelegate).memes[indexPath.row]
        cell.updateUI(for: meme)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memeViewer = storyboard?.instantiateViewController(withIdentifier: "MemeView") as! MemeViewerVC
        let currentMeme = memes[indexPath.row]
        memeViewer.memedImage = memes[indexPath.row]
//        memeViewer.bottomTextField.text = currentMeme.bottomText
//        memeViewer.topTextField.text = currentMeme.topText
//        memeViewer.memedImage?.originalImage = currentMeme.memedImage
        self.navigationController?.pushViewController(memeViewer, animated: true)
    }
}
