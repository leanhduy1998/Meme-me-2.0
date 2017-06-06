//
//  TableViewCell.swift
//  Meme me 2.0
//
//  Created by Duy Le on 6/6/17.
//  Copyright © 2017 Andrew Le. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleTF: UILabel!

    @IBOutlet weak var memeIV: UIImageView!
    @IBOutlet weak var topTf: UILabel!
    @IBOutlet weak var bottomTF: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
