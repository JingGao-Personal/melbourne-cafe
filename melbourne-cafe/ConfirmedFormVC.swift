//
//  ConfirmedFormVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 27/5/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class ConfirmedFormVC: UIViewController {
    
    @IBOutlet weak var confirmedNameLbl: UILabel!
    @IBOutlet weak var confirmedEmailLbl: UILabel!
    @IBOutlet weak var confirmedPwdLbl: UILabel!
    @IBOutlet weak var confirmedAbnLbl: UILabel!
    @IBOutlet weak var confirmedAddressLbl: UILabel!
    @IBOutlet weak var confirmedPhoneLbl: UILabel!
    @IBOutlet weak var uncheckedBox: UIButton!
    @IBOutlet weak var submitOutlet: UIButton!
    
    
    
    var nameText = String()
    var emailText = String()
    var pwdText = String()
    var abnText = String()
    var addressText = String()
    var phoneText = String()
    
    var checkBox = UIImage(named: "select")
    var uncheckBox = UIImage(named: "check-box-empty")
    
    var isBoxClicked:Bool!
    
    var register = Register()
    
    @IBAction func submitTapped(_ sender: Any) {
        register.createUser(name: nameText, password: pwdText, email: emailText, phone: phoneText, abn: abnText, address: addressText, completed: {self.updateUI()})
    }
    
    func updateUI() {
        if register.serverResponse == "User created successfully" {
            print("The result is \(register.serverResponse)")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyBoard.instantiateViewController(withIdentifier: "login")
            self.present(nextVC, animated: true, completion: nil)
        } else {
            print("The result is \(register.serverResponse)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isBoxClicked = false
        submitOutlet.isEnabled = false
        
        confirmedNameLbl.text = nameText
        confirmedEmailLbl.text = emailText
        confirmedPwdLbl.text = pwdText
        confirmedAbnLbl.text = abnText
        confirmedAddressLbl.text = addressText
        confirmedPhoneLbl.text = phoneText
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkClicked(_ sender: Any) {
        if isBoxClicked == true {
            isBoxClicked = false
        } else {
            isBoxClicked = true
        }
        
        if isBoxClicked == true {
            uncheckedBox.setImage(checkBox, for: UIControlState.normal)
            submitOutlet.isEnabled = true
        } else {
            uncheckedBox.setImage(uncheckBox, for: UIControlState.normal)
            submitOutlet.isEnabled = false
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
   
    
       
}
