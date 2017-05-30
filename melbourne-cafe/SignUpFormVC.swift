//
//  ViewController.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 18/5/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class SignUpFormVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var pwdLabel: UITextField!
    @IBOutlet weak var comfirmPwdLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var abnLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var nextOutlet: UIButton!
    
    var correctIcon = UIImage(named: "correct")
    var wrongIcon = UIImage(named: "wrong")
    
    @IBOutlet weak var nameCheck: UIImageView!
    @IBOutlet weak var emailCheck: UIImageView!
    @IBOutlet weak var pwdCheck: UIImageView!
    @IBOutlet weak var confirmPwdCheck: UIImageView!
    @IBOutlet weak var phoneCheck: UIImageView!
    @IBOutlet weak var abnCheck: UIImageView!
    @IBOutlet weak var addressCheck: UIImageView!
    
    
    
    var textCheck = TextCheck()
    
    
//    @IBAction func submitTapped(_ sender: Any) {
//        
//        register.createUser(name: "test", password: "test", email: "test", phone: "test", abn: "test", address: "test")
//        
////        print("This is Message: \(register.serverResponse)")
//        print(register.serverResponse)
//    }
    @IBAction func nextTapped(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nextOutlet.isEnabled = false
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show confirmed form" {
            let vc = segue.destination as! ConfirmedFormVC
            
            vc.nameText = nameLabel.text!
            vc.emailText = emailLabel.text!
            vc.pwdText = pwdLabel.text!
            vc.abnText = abnLabel.text!
            vc.addressText = addressLabel.text!
            vc.phoneText = phoneLabel.text!
        }
    }
    
    @IBAction func checkTextField(_ sender: UITextField) {
        
        let tagNumber = sender.tag
        
        switch tagNumber
        
        {
        case 0:
            if textCheck.checkEmpty(text: nameLabel.text!) == false {
                nameCheck.image = wrongIcon
            } else {
                nameCheck.image = correctIcon
            }
        case 1:
            if textCheck.checkEmail(text: emailLabel.text!) == true {
                emailCheck.image = correctIcon
            } else {
                emailCheck.image = wrongIcon
            }
        case 2:
            if textCheck.checkEmpty(text: pwdLabel.text!) == true {
                pwdCheck.image = correctIcon
            } else {
                pwdCheck.image = wrongIcon
            }
        case 3:
            if textCheck.pwdSame(pwd: pwdLabel.text!, confirmedPwd: comfirmPwdLabel.text!) == true {
                confirmPwdCheck.image = correctIcon
            } else {
                confirmPwdCheck.image = wrongIcon
            }
        case 4:
            if textCheck.checkPhone(phone: phoneLabel.text!) == true {
                phoneCheck.image = correctIcon
            } else {
                phoneCheck.image = wrongIcon
            }
        case 5:
            if textCheck.checkAbn(abn: abnLabel.text!) == true {
                abnCheck.image = correctIcon
            } else {
                abnCheck.image = wrongIcon
            }
        case 6:
            if textCheck.checkEmpty(text: addressLabel.text!) == true {
                addressCheck.image = correctIcon
            } else {
                addressCheck.image = wrongIcon
            }
            
            
        default: break
            
        
        }
        
        if (nameCheck.image == correctIcon && emailCheck.image == correctIcon && pwdCheck.image == correctIcon && confirmPwdCheck.image == correctIcon && phoneCheck.image == correctIcon && abnCheck.image == correctIcon && addressCheck.image == correctIcon) == true {
            nextOutlet.isEnabled = true
        } else {
            nextOutlet.isEnabled = false
            
        }

        
        
        
        
    }
    

    


}

