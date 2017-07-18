//
//  OrderHistoryCell.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 18/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class OrderHistoryCell: UITableViewCell {
    
    @IBOutlet weak var refNumberLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    var orderHistory: OrderHistory? {
        didSet {
            self.updateUI()
        }
        
    }
    
    private func updateUI() {
        self.refNumberLbl.text = orderHistory?.ReferenceNumber
        self.timeLbl.text = orderHistory?.dateAndTime
    }
}
