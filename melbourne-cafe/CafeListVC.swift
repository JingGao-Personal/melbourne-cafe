//
//  CafeListVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 18/6/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class CafeListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var cafeTableView: UITableView!
    var loadCafeList = LoadCafeList()
    var imageFunctions = ImageFunctions()
    var cafeArray = [Cafe]() {
        didSet
        {
            self.cafeTableView.reloadData()
        }
    }
    
    
    var list:NSDictionary = [:] {
        didSet
        {
            self.cafeTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCafeList.loadList(email: UserDefaults.standard.string(forKey: "email")!, completed: {self.updateList()})
        
        cafeTableView.delegate = self
        cafeTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cafeCell", for: indexPath) as? CafeCell else {
            fatalError("The dequeued cell is not an instance of cafeCell.")
        }
        
        
        
        cell.cafe = self.cafeArray[indexPath.row]
        
        
        return cell
    }
    
    func updateList() {
        list = loadCafeList.serverResponse.value(forKey: "data") as! NSDictionary
        
        
        for item in list
        {
            let cafe = Cafe()
            
            let data = item.value as! NSDictionary
            cafe.cafeName = data["Name"] as! String
            cafe.imagePath = data["IFNULL(Image, '')"] as! String
            
            cafeArray.append(cafe)
            
            if cafe.imagePath == "" {
                imageFunctions.loadImage(url: DEFAULT_IMAGE_URL, complete: {cafe.image = self.imageFunctions._image
                    self.cafeTableView.reloadData()
                })
            } else {
                imageFunctions.loadImage(url: PROFILE_IMAGE_URL + cafe.imagePath, complete: {cafe.image = self.imageFunctions._image
                    self.cafeTableView.reloadData()
                })
                
            }
            
            
        }
        
        
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
