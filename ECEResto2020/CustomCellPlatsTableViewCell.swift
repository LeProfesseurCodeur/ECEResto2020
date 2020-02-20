//
//  CustomCellPlatsTableViewCell.swift
//  ECEResto2020
//
//  Created by Administrateur on 20/01/2020.
//  Copyright © 2020 Dylan Luchmun. All rights reserved.
//

import UIKit

class CustomCellPlatsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titreCell: UILabel!
    @IBOutlet weak var descCell: UILabel!
    @IBOutlet weak var prixCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
