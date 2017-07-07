//
//  AddProductVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 5/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class AddProductVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var coffeeNamePicker: UIPickerView!
    var coffeeData: [String] = [String]()
    
    @IBOutlet weak var largePriceCheck: UIImageView!
    @IBOutlet weak var mediumPriceCheck: UIImageView!
    @IBOutlet weak var smallPriceCheck: UIImageView!
    
    @IBOutlet weak var largePriceText: UITextField!
    @IBOutlet weak var mediumPriceText: UITextField!
    @IBOutlet weak var smallPriceText: UITextField!
    
    
    var correctIcon = UIImage(named: "correct")
    var wrongIcon = UIImage(named: "wrong")
    
    @IBOutlet weak var confirm: UIButton!
    
    var textCheck = TextCheck()
    var createCoffee = CreateCoffee()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coffeeNamePicker.delegate = self
        self.coffeeNamePicker.dataSource = self
//        confirm.isEnabled = false
//        largePriceCheck.image = wrongIcon
//        mediumPriceCheck.image = wrongIcon
//        smallPriceCheck.image = wrongIcon
        coffeeData = ["Cappuccino", "Espresso", "The Flat White", "Latte"]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coffeeData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coffeeData[row]
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func priceCheck(_ sender: UITextField) {
//        let tagNumber = sender.tag
//        switch tagNumber {
//        case 0:
//            if textCheck.checkPrice(price: Double(largePriceText.text!)!) == false {
//                largePriceCheck.image = wrongIcon
//            } else {
//                largePriceCheck.image = correctIcon
//            }
//        case 1:
//            if textCheck.checkPrice(price: Double(mediumPriceText.text!)!) == false {
//                mediumPriceCheck.image = wrongIcon
//            } else {
//                mediumPriceCheck.image = correctIcon
//            }
//        case 2:
//            if textCheck.checkPrice(price: Double(smallPriceText.text!)!) == false {
//                smallPriceCheck.image = wrongIcon
//            } else {
//                smallPriceCheck.image = correctIcon
//            }
//        default:
//            break
//        }
//        
//        if(largePriceCheck.image == correctIcon && mediumPriceCheck.image == correctIcon && smallPriceCheck.image == correctIcon) == true {
//            confirm.isEnabled = true
//        } else {
//            confirm.isEnabled = false
//        }
    }
    
    
    @IBAction func confirmTapped(_ sender: Any) {
        createCoffee.addCoffee(shopId: UserDefaults.standard.integer(forKey: "shopId"), name: coffeeData[coffeeNamePicker.selectedRow(inComponent: 0)], largePrice: Double(largePriceText.text!)!, mediumPirce: Double(mediumPriceText.text!)!, smallPrice: Double(smallPriceText.text!)!, imagePath:"test", completed: {self.responseUpdate()})
    }
    
    func responseUpdate() {
        print(createCoffee.serverResponse)
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
