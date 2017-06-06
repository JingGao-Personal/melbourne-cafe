//
//  EditedFormVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 2/6/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class EditedProfileVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var pwdLbl: UITextField!
    @IBOutlet weak var abnLbl: UITextField!
    @IBOutlet weak var addressLbl: UITextField!
    @IBOutlet weak var descriptionLbl: UITextField!
    @IBOutlet weak var phoneLbl: UITextField!
    
    var correctIcon = UIImage(named: "correct")
    var wrongIcon = UIImage(named: "wrong")
    
    @IBOutlet weak var checkName: UIImageView!
    @IBOutlet weak var checkEmail: UIImageView!
    @IBOutlet weak var checkPwd: UIImageView!
    @IBOutlet weak var checkAbn: UIImageView!
    @IBOutlet weak var checkAddress: UIImageView!
    @IBOutlet weak var checkDescription: UIImageView!
    @IBOutlet weak var checkPhone: UIImageView!
    
    var textCheck = TextCheck()
    
    @IBOutlet weak var updateName: UIButton!
    @IBOutlet weak var updateEmail: UIButton!
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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text! = nameText
        emailLbl.text! = emailText
        pwdLbl.text! = pwdText
        abnLbl.text! = abnText
        addressLbl.text! = addressText
        descriptionLbl.text! = descriptionText
        phoneLbl.text! = phoneText
        
        

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
            
        case 1:
            if textCheck.checkEmail(text: emailLbl.text!) == false {
                checkEmail.image = wrongIcon
                updateEmail.isEnabled = false
            } else {
                checkEmail.image = correctIcon
                updateEmail.isEnabled = true
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
        
        
        
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
