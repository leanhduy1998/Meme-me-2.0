//
//  IndividualMemeViewController.swift
//  Meme me 2.0
//
//  Created by Duy Le on 6/5/17.
//  Copyright © 2017 Andrew Le. All rights reserved.
//

import UIKit

class IndividualMemeViewController: UIViewController {
    var image:UIImage!
    @IBOutlet weak var memeImage: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memeImage.image = image
    }
    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    

  

}
