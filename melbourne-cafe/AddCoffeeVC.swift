//
//  AddProductVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 5/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class AddCoffeeVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var coffeeNamePicker: UIPickerView!
    var coffeeData: [String] = [String]()
    var _coffeeImage = UIImage()
    
    @IBOutlet weak var largePriceCheck: UIImageView!
    @IBOutlet weak var mediumPriceCheck: UIImageView!
    @IBOutlet weak var smallPriceCheck: UIImageView!
    
    @IBOutlet weak var largePriceText: UITextField!
    @IBOutlet weak var mediumPriceText: UITextField!
    @IBOutlet weak var smallPriceText: UITextField!
    
    
    var correctIcon = UIImage(named: "correct")
    var wrongIcon = UIImage(named: "wrong")
    @IBOutlet weak var uploadIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var confirm: UIButton!
    @IBOutlet weak var coffeeImage: UIImageView!
    
    var textCheck = TextCheck()
    var createCoffee = CreateCoffee()
    var imageFunctions = ImageFunctions()
    let myPickerController = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPickerController.delegate = self
        
        self.coffeeNamePicker.delegate = self
        self.coffeeNamePicker.dataSource = self
        coffeeImage.image = _coffeeImage
        confirm.isEnabled = false
        largePriceCheck.image = wrongIcon
        mediumPriceCheck.image = wrongIcon
        smallPriceCheck.image = wrongIcon
        coffeeData = ["Cappuccino", "Espresso", "The-Flat-White", "Latte"]
        
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
        let tagNumber = sender.tag
        switch tagNumber {
        case 0:
            if textCheck.checkPrice(price: largePriceText.text!) == false {
                largePriceCheck.image = wrongIcon
            } else {
                largePriceCheck.image = correctIcon
            }
        case 1:
            if textCheck.checkPrice(price: mediumPriceText.text!) == false {
                mediumPriceCheck.image = wrongIcon
            } else {
                mediumPriceCheck.image = correctIcon
            }
        case 2:
            if textCheck.checkPrice(price: smallPriceText.text!) == false {
                smallPriceCheck.image = wrongIcon
            } else {
                smallPriceCheck.image = correctIcon
            }
        default:
            break
        }
        
        if(largePriceCheck.image == correctIcon && mediumPriceCheck.image == correctIcon && smallPriceCheck.image == correctIcon) == true {
            confirm.isEnabled = true
        } else {
            confirm.isEnabled = false
        }
    }
    
    @IBAction func selectTapped(_ sender: Any) {
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        coffeeImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmTapped(_ sender: Any) {
        if coffeeImage.image == nil {
            let alertController = UIAlertController(title: "Notification", message: "please select an image", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            uploadIndicator.startAnimating()
            
            createCoffee.addCoffee(shopId: UserDefaults.standard.integer(forKey: "shopId"), name: coffeeData[coffeeNamePicker.selectedRow(inComponent: 0)], largePrice: Double(largePriceText.text!)!, mediumPirce: Double(mediumPriceText.text!)!, smallPrice: Double(smallPriceText.text!)!, imagePath: "coffeeImages/" + String(UserDefaults.standard.integer(forKey: "shopId")) + coffeeData[coffeeNamePicker.selectedRow(inComponent: 0)] + ".jpeg", completed: {self.responseUpdate()})
            
            imageFunctions.uploadCoffeeImage(image: coffeeImage.image!, shopId: UserDefaults.standard.integer(forKey: "shopId"), name: coffeeData[coffeeNamePicker.selectedRow(inComponent: 0)], complete: {self.uploadIndicator.stopAnimating()})
            dismiss(animated: true, completion: nil)
        }
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
