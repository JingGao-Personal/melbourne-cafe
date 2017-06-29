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
    
//    var imageFunctions = ImageFunctions()
    
    var cafe:Cafe?
        {
        didSet
        {
            self.updateUI()
        }
    }
    
    private func updateUI()
    {
        self.cafeName.text = cafe?.cafeName
        
//        if cafe?.imagePath == "" {
//            imageFunctions.loadImage(url: DEFAULT_IMAGE_URL, complete: {self.infoImage.image = self.imageFunctions._image})
//        } else {
//            imageFunctions.loadImage(url: PROFILE_IMAGE_URL + (cafe?.imagePath)!, complete: {self.infoImage.image = self.imageFunctions._image})
//            
//        }
        self.infoImage.image = cafe?.image
        self.distance.text! = String(format: "%.2f", cafe!.distance) + " m"
    }
    
    
}
