//
//  CollectionViewController.swift
//  Meme me 2.0
//
//  Created by Duy Le on 6/6/17.
//  Copyright © 2017 Andrew Le. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectionCell"

class CollectionViewController: UICollectionViewController {
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var currentMeme:Meme!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return appDelegate.memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> CollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let meme = appDelegate.memes[indexPath.row]
        cell.image.image = meme.originalImage
        configure(cell.topTF, defaultText: meme.topText)
        configure(cell.bottomTF, defaultText: meme.bottomText)
        return cell
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
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentMeme = appDelegate.memes[indexPath.row]
        performSegue(withIdentifier: "IndividualMemeViewController2", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? IndividualMemeViewController {
           destination.image = currentMeme.memedImage
        }
    }

  

}
