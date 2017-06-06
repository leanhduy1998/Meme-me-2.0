//
//  TableViewController.swift
//  Meme me 2.0
//
//  Created by Duy Le on 6/4/17.
//  Copyright © 2017 Andrew Le. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UITextFieldDelegate {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var currentMeme: Meme!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        super.viewWillAppear(animated)
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> TableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        let meme = appDelegate.memes[indexPath.row]
        
        cell?.memeIV.image = meme.originalImage
        
        var topIndex: String.Index!
        var bottomIndex: String.Index!
        
        if(meme.topText.characters.count<=5){
            topIndex = meme.topText.endIndex
        }
        else {
            topIndex = meme.topText.index(meme.topText.startIndex, offsetBy: 4)
        }
        
        
        if(meme.bottomText.characters.count<=5){
            bottomIndex = meme.bottomText.startIndex
        }
        else {
            let startIndexTemp = meme.bottomText.characters.count - 6  
            bottomIndex = meme.bottomText.index(meme.bottomText.startIndex, offsetBy: startIndexTemp)
        }
        cell?.titleTF.text = meme.topText.substring(to: topIndex) + " ... " + meme.bottomText.substring(from: bottomIndex)
        configure((cell?.topTf)!, defaultText: meme.topText)
        configure((cell?.bottomTF)!, defaultText: meme.bottomText)
        return cell!
    }
    func configure(_ label: UILabel, defaultText: String) {
        let memeTextAttributes:[String:Any] = [
            NSStrokeColorAttributeName: UIColor.black,
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 12)!,
            NSStrokeWidthAttributeName: -1.0]
        let myString = NSMutableAttributedString(string: defaultText, attributes: memeTextAttributes )
        label.sizeToFit()
        label.attributedText = myString
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentMeme = appDelegate.memes[indexPath.row]
        performSegue(withIdentifier: "IndividualMemeViewController", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? IndividualMemeViewController {
            print(currentMeme.bottomText)
            if currentMeme.memedImage != nil {
                destination.image = currentMeme.memedImage 
            }
        }
    }
    

}
