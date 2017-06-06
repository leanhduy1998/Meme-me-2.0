//
//  TableViewController.swift
//  Meme me 2.0
//
//  Created by Duy Le on 6/4/17.
//  Copyright © 2017 Andrew Le. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let meme = appDelegate.memes[indexPath.row]
        cell.imageView?.image = meme.memedImage
        
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
        
        cell.textLabel?.text = meme.topText.substring(to: topIndex) + " ... " + meme.bottomText.substring(from: bottomIndex)
        return cell
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
