//
//  LoginVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 30/5/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var pwdLbl: UITextField!
    @IBOutlet weak var serverLbl: UILabel!
    
    var login = Login()
    
    @IBAction func loginTapped(_ sender: Any) {
        login.userLogin(email: emailLbl.text!, password: pwdLbl.text!, completed: {self.updateUI()})
    }
    
    func updateUI() {
        let alert = UIAlertController(title: "notification", message: login.serverResponse, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
