//
//  CoffeeCellVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 10/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class CoffeeCellVC: UIViewController {
    
    var coffee:Coffee!
    
    @IBOutlet weak var coffeeNameLbl: UILabel!
    @IBOutlet weak var largePriceTxt: UITextField!
    @IBOutlet weak var mediumPriceTxt: UITextField!
    @IBOutlet weak var smallPriceTxt: UITextField!
    @IBOutlet weak var coffeeImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coffeeNameLbl.text = coffee.coffeeName
        self.largePriceTxt.text = String(coffee.largePrice)
        self.mediumPriceTxt.text = String(coffee.mediumPrice)
        self.smallPriceTxt.text = String(coffee.smallPrice)
        self.coffeeImage.image = coffee.coffeeImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
