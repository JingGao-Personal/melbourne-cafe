//
//  LoginVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 30/5/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var pwdLbl: UITextField!
    @IBOutlet weak var serverLbl: UILabel!
    
    var login = Login()
    
    @IBAction func loginTapped(_ sender: Any) {
        login.userLogin(email: emailLbl.text!, password: pwdLbl.text!, completed: {self.updateUI()})
    }
    
    func updateUI() {
        if login.serverResponse == "login successfully" {
            UserDefaults.standard.set(emailLbl.text!, forKey: "email")
            UserDefaults.standard.set(pwdLbl.text!, forKey: "password")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyBoard.instantiateViewController(withIdentifier: "tabBar")
            self.present(nextVC, animated: true, completion: nil)
            
        } else {
        let alert = UIAlertController(title: "notification", message: login.serverResponse, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
       
}
