//
//  ProfileVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 31/5/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var abnLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    
    var profile = Profile()
    var imageFunctions = ImageFunctions()
    var imagePath: String = ""
    
    @IBOutlet weak var profileImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        profile.myProfile(email: UserDefaults.standard.string(forKey: "email")!, completed: {self.update()})
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Editing Page" {
            let vc = segue.destination as! EditedProfileVC
            vc.nameText = nameLbl.text!
            vc.pwdText = UserDefaults.standard.string(forKey: "password")!
            vc.emailText = UserDefaults.standard.string(forKey: "email")!
            vc.abnText = abnLbl.text!
            vc.addressText = addressLbl.text!
            vc.descriptionText = descriptionLbl.text!
            vc.phoneText = phoneLbl.text!
            vc._profileImage = profileImage.image!
            
        }
    }
    
    func update() {
        UserDefaults.standard.set(profile.serverResponse.value(forKey: "shopId"), forKey: "shopId")
        nameLbl.text! = profile.serverResponse.value(forKey: "Name") as! String
        emailLbl.text! = UserDefaults.standard.string(forKey: "email")!
        abnLbl.text! = profile.serverResponse.value(forKey: "ABN") as! String
        addressLbl.text! = profile.serverResponse.value(forKey: "Address") as! String
        descriptionLbl.text! = profile.serverResponse.value(forKey: "IFNULL(Description, '')") as! String
        phoneLbl.text! = profile.serverResponse.value(forKey: "Ph_number") as! String
        imagePath = profile.serverResponse.value(forKey: "IFNULL(Image, '')") as! String
        
        if imagePath == "" {
            imageFunctions.loadImage(url: DEFAULT_IMAGE_URL, complete: {self.updateImage()})
        } else {
            imageFunctions.loadImage(url: PROFILE_IMAGE_URL + imagePath, complete: {self.updateImage()})
            
        }

    
    }
    
    func updateImage() {
        profileImage.image = imageFunctions._image
    }
}
