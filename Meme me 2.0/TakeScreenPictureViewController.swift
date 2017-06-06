//
//  TakeScreenPictureViewController.swift
//  Meme me 2.0
//
//  Created by Duy Le on 6/5/17.
//  Copyright © 2017 Andrew Le. All rights reserved.
//

import UIKit

class TakeScreenPictureViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.navigationController?.isNavigationBarHidden = false
        
        
        
        super.viewWillAppear(animated)
    }


}
