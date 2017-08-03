//
//  EditedFormVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 2/6/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit
import SwiftHash

class EditedProfileVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var pwdLbl: UITextField!
    @IBOutlet weak var abnLbl: UITextField!
    @IBOutlet weak var addressLbl: UITextField!
    @IBOutlet weak var descriptionLbl: UITextField!
    @IBOutlet weak var phoneLbl: UITextField!
    
    var correctIcon = UIImage(named: "correct")
    var wrongIcon = UIImage(named: "wrong")
    
    @IBOutlet weak var checkName: UIImageView!
    @IBOutlet weak var checkPwd: UIImageView!
    @IBOutlet weak var checkAbn: UIImageView!
    @IBOutlet weak var checkAddress: UIImageView!
    @IBOutlet weak var checkDescription: UIImageView!
    @IBOutlet weak var checkPhone: UIImageView!
    
    var textCheck = TextCheck()
    var update = Update()
    var imageFunctions = ImageFunctions()
    
    @IBOutlet weak var updateName: UIButton!
    @IBOutlet weak var updatePwd: UIButton!
    @IBOutlet weak var updateAbn: UIButton!
    @IBOutlet weak var updateAddress: UIButton!
    @IBOutlet weak var updateDescription: UIButton!
    @IBOutlet weak var updatePhone: UIButton!
    
    var nameText = String()
    var emailText = String()
    var pwdText = String()
    var abnText = String()
    var addressText = String()
    var descriptionText = String()
    var phoneText = String()
    
    @IBOutlet weak var myImageView: UIImageView!
    var _profileImage = UIImage()
    
    let myPickerController = UIImagePickerController()
    
    @IBOutlet weak var uploadingIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerController.delegate = self
        
        
        nameLbl.text! = nameText
        pwdLbl.text! = pwdText
        abnLbl.text! = abnText
        addressLbl.text! = addressText
        descriptionLbl.text! = descriptionText
        phoneLbl.text! = phoneText
        myImageView.image = _profileImage
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkTextField(_ sender: UITextField) {
        
        let tagNumber = sender.tag
        
        switch tagNumber {
        case 0:
            if textCheck.checkEmpty(text: nameLbl.text!) == false {
                checkName.image = wrongIcon
                updateName.isEnabled = false
            } else {
                checkName.image = correctIcon
                updateName.isEnabled = true
            }
            
        case 2:
            if textCheck.checkEmpty(text: pwdLbl.text!) == false {
                checkPwd.image = wrongIcon
                updatePwd.isEnabled = false
            } else {
                checkPwd.image = correctIcon
                updatePwd.isEnabled = true
            }
        case 3:
            if textCheck.checkAbn(abn: abnLbl.text!) == false {
                checkAbn.image = wrongIcon
                updateAbn.isEnabled = false
            } else {
                checkAbn.image = correctIcon
                updateAbn.isEnabled = true
            }
        case 4:
            if textCheck.checkEmpty(text: addressLbl.text!) == false {
                checkAddress.image = wrongIcon
                updateAddress.isEnabled = false
            } else {
                checkAddress.image = correctIcon
                updateAddress.isEnabled = true
            }
        case 5:
            if textCheck.checkEmpty(text: descriptionLbl.text!) == false {
                checkDescription.image = wrongIcon
                updateDescription.isEnabled = false
            } else {
                checkDescription.image = correctIcon
                updateDescription.isEnabled = true
            }
        case 6:
            if textCheck.checkPhone(phone: phoneLbl.text!) == false {
                checkPhone.image = wrongIcon
                updatePhone.isEnabled = false
            } else {
                checkPhone.image = correctIcon
                updatePhone.isEnabled = true
            }
        default:
            break
        }
    }
    
    
    
    @IBAction func update(_ sender: UIButton) {
        
        let tagNumber = sender.tag
        
        switch tagNumber {
        case 0:
            update.updateUser(userInfoType: "Name", updatedUserInfo: nameLbl.text!, email: emailText, completed: {self.updateUI()})
        case 2:
            update.updateUser(userInfoType: "Password", updatedUserInfo: MD5(pwdLbl.text!), email: emailText, completed: {self.updateUI()})
        case 3:
            update.updateUser(userInfoType: "ABN", updatedUserInfo: abnLbl.text!, email: emailText, completed: {self.updateUI()})
        case 4:
            update.updateUser(userInfoType: "Address", updatedUserInfo: addressLbl.text!, email: emailText, completed: {self.updateUI()})
        case 5:
            update.updateUser(userInfoType: "Description", updatedUserInfo: descriptionLbl.text!, email: emailText, completed: {self.updateUI()})
        case 6:
            update.updateUser(userInfoType: "Ph_number", updatedUserInfo: phoneLbl.text!, email: emailText, completed: {self.updateUI()})
        default:
            break
        }
        
    }
    
    @IBAction func backTapped(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextVC = storyBoard.instantiateViewController(withIdentifier: "profile")
//        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func uploadTapped(_ sender: Any) {
        if myImageView.image == nil {
            let alertController = UIAlertController(title: "Notification", message: "please select an image", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            uploadingIndicator.startAnimating()
            imageFunctions.uploadImage(image: myImageView.image!, email: emailText, complete: {self.uploadingIndicator.stopAnimating()})
        }
    }
    
    @IBAction func selectTapped(_ sender: Any) {
        
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        print(update.serverResponse)
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
