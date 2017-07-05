//
//  AddProductVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 5/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class AddProductVC: UIViewController {
    
    @IBOutlet weak var coffeeNamePicker: UIPickerView!
    var coffeeData: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        coffeeData = ["Cappuccino", "Espresso", "The Flat White", "Latte"]

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
