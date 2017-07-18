//
//  OrderCell.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 18/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {
    @IBOutlet weak var refNumberLbl: UILabel!
    @IBOutlet weak var orderTimeLbl: UILabel!
    @IBOutlet weak var descriptionTxt: UITextView!
    
    var order: Order? {
        didSet {
            self.updateUI()
        }
    }
    
    private func updateUI() {
        self.refNumberLbl.text = order?.ReferenceNumber
        self.orderTimeLbl.text = order?.dateAndTime
        self.descriptionTxt.text = order?.message
    }
    
}
