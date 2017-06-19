//
//  CafeCell.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 19/6/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class CafeCell: UITableViewCell {
    
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var cafeName: UILabel!
    @IBOutlet weak var stars: UILabel!
    @IBOutlet weak var distance: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
