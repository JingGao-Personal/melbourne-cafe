//
//  OrderManagementVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 18/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class OrderManagementVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var orderTableView: UITableView!
    var loadOrderList = LoadOrderList()
    
    var orderArray = [Order]() {
        didSet {
            self.orderTableView.reloadData()
        }
    }
    
    var list:NSDictionary = [:] {
        didSet {
            self.orderTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.orderTableView.reloadData()
        loadOrderList.loadList(shopId: UserDefaults.standard.integer(forKey: "shopId"), completed: {self.updateList()})
        
        orderTableView.delegate = self
        orderTableView.dataSource = self

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as? OrderCell else {
            fatalError("The dequeued cell is not an instance of orderCell.")
        }
        
        cell.order = self.orderArray[indexPath.row]
        
        return cell
        
    }
    
    func updateList() {
        list = loadOrderList.serverResponse.value(forKey: "data") as! NSDictionary
        
        for item in list {
            let order = Order()
            let data = item.value as! NSDictionary
            order.ReferenceNumber = data["ReferenceNumber"] as! String
            order.dateAndTime = data["dateAndTime"] as? String
            order.message = data["message"] as! String
            order.orderStatus = data["orderStatus"] as? String
            orderArray.append(order)
        }
        
        self.orderTableView.reloadData()
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
