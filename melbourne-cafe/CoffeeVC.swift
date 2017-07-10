//
//  ProductVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 5/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class CoffeeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var coffeeTableView: UITableView!
    var loadProductList = LoadProductList()
    var imageFunctions = ImageFunctions()
    
    var coffeeArray = [Coffee]() {
        didSet
        {
            self.coffeeTableView.reloadData()
        }
    }
    
    var list:NSDictionary = [:] {
        didSet
        {
            self.coffeeTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProductList.loadList(shopId: UserDefaults.standard.integer(forKey: "shopId"), completed: {self.updateList()})
        
        coffeeTableView.delegate = self
        coffeeTableView.dataSource = self

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
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeCell", for: indexPath) as? CoffeeCell
            else {
            fatalError("The dequeued cell is not an instance of cafeCell.")
        }
        
        cell.coffee = self.coffeeArray[indexPath.row]
        
        return cell
    }
    
    func updateList() {
        list = loadProductList.serverResponse.value(forKey: "data") as! NSDictionary
        
        for item in list {
            let coffee = Coffee()
            let data = item.value as! NSDictionary
            coffee.coffeeName = data["name"] as! String
            coffee.imagePath = data["imagePath"] as! String
            coffeeArray.append(coffee)
            
            if coffee.imagePath == "" {
                imageFunctions.loadImage(url: DEFAULT_IMAGE_URL, complete: {coffee.coffeeImage = self.imageFunctions._image
                    self.coffeeTableView.reloadData()
                })
            } else {
                imageFunctions.loadImage(url: IMAGE_URL + coffee.imagePath, complete: {coffee.coffeeImage = self.imageFunctions._image
                    self.coffeeTableView.reloadData()
                })
                
            }

        }
        
        self.coffeeTableView.reloadData()
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
