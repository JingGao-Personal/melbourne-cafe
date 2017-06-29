//
//  CafeCellVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 29/6/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class CafeCellVC: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cafeImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
