//
//  CoffeeCell.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 8/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class CoffeeCell: UITableViewCell {
    
    @IBOutlet weak var coffeeNameLbl: UILabel!
    @IBOutlet weak var coffeeImage: UIImageView!
    
    
    var coffee: Coffee? {
        didSet {
            self.updateUI()
        }
    }
    
    private func updateUI() {
        self.coffeeNameLbl.text = coffee?.coffeeName
        self.coffeeImage.image = coffee?.coffeeImage
    }

}
