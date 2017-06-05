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
    @IBOutlet weak var currentPwd: UITextField!
    @IBOutlet weak var newPwd: UITextField!
    @IBOutlet weak var confirmedPwd: UITextField!
    @IBOutlet weak var abnLbl: UITextField!
    @IBOutlet weak var addressLbl: UITextField!
    @IBOutlet weak var descriptionLbl: UITextField!
    
    var correctIcon = UIImage(named: "correct")
    var wrongIcon = UIImage(named: "wrong")
    
    @IBOutlet weak var checkName: UIImageView!
    @IBOutlet weak var checkEmail: UIImageView!
    @IBOutlet weak var checkCurrentPwd: UIImageView!
    @IBOutlet weak var checkNewPwd: UIImageView!
    @IBOutlet weak var checkConfirmedPwd: UIImageView!
    @IBOutlet weak var checkAbn: UIImageView!
    @IBOutlet weak var checkAddress: UIImageView!
    @IBOutlet weak var checkDescription: UIImageView!
    

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
