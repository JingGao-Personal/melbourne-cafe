//
//  CoffeeCellVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 10/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class CoffeeCellVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var coffee:Coffee!
    var updateCoffeeInfo = UpdateCoffeeInfo()
    var imageFunctions = ImageFunctions()
    var deleteCoffee = DeleteCoffee()
    
    @IBOutlet weak var coffeeNameLbl: UILabel!
    @IBOutlet weak var largePriceTxt: UITextField!
    @IBOutlet weak var mediumPriceTxt: UITextField!
    @IBOutlet weak var smallPriceTxt: UITextField!
    @IBOutlet weak var coffeeImage: UIImageView!
    @IBOutlet weak var uploadIndicator: UIActivityIndicatorView!
    
    let myPickerController = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coffeeNameLbl.text = coffee.coffeeName
        self.largePriceTxt.text = String(coffee.largePrice)
        self.mediumPriceTxt.text = String(coffee.mediumPrice)
        self.smallPriceTxt.text = String(coffee.smallPrice)
        self.coffeeImage.image = coffee.coffeeImage
        myPickerController.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectTapped(_ sender: Any) {
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        coffeeImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confrimToEdit(_ sender: Any) {
        uploadIndicator.stopAnimating()
        
        updateCoffeeInfo.updateUser(largePrice: Double(largePriceTxt.text!)!, mediumPrice: Double(mediumPriceTxt.text!)!, smallPrice: Double(smallPriceTxt.text!)!, imagePath:"coffeeImages/" + String(UserDefaults.standard.integer(forKey: "shopId")) + coffeeNameLbl.text! + ".jpeg", shopId: UserDefaults.standard.integer(forKey: "shopId"), name: coffeeNameLbl.text!, completed: {self.responseUpdate()})
        
        imageFunctions.uploadCoffeeImage(image: coffeeImage.image!, shopId: UserDefaults.standard.integer(forKey: "shopId"), name: coffeeNameLbl.text!, complete: {self.uploadIndicator.stopAnimating()})
        dismiss(animated: true, completion: nil)
    }
    
    func responseUpdate() {
        print(updateCoffeeInfo.serverResponse)
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        deleteCoffee.deleteCoffee(shopId: UserDefaults.standard.integer(forKey: "shopId"), name: coffeeNameLbl.text!, completed: {self.deleteInfoResponse()})
        
        imageFunctions.deleteCoffeeImage(target_file: String(UserDefaults.standard.integer(forKey: "shopId")) + coffeeNameLbl.text! + ".jpeg", complete: {self.imageDeleteResponse()})
        
        dismiss(animated: true, completion: nil)
    }
    
    func deleteInfoResponse() {
        print(deleteCoffee.serverResponse)
    }
    
    func imageDeleteResponse() {
        print(imageFunctions.serverResonse)
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
