//
//  OrderHistoryVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 18/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit

class OrderHistoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var orderHistoryTableView: UITableView!
    var loadOrderHistory = LoadOrderHistory()
    
    var orderHistoryArray = [OrderHistory]() {
        didSet {
            self.orderHistoryTableView.reloadData()
        }
    }
    
    var list:NSDictionary = [:] {
        didSet {
            self.orderHistoryTableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadOrderHistory.loadList(shopId: UserDefaults.standard.integer(forKey: "shopId"), completed: {self.updateList()})
        self.orderHistoryTableView.delegate = self
        self.orderHistoryTableView.dataSource = self

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistory", for: indexPath) as? OrderHistoryCell else {
            fatalError("The dequeued cell is not an instance of orderHistory.")
        }
        
        cell.orderHistory = self.orderHistoryArray[indexPath.row]
        
        return cell
        
    }
    
    func updateList() {
        
        list = loadOrderHistory.serverResponse.value(forKey: "data") as! NSDictionary
        
        for item in list {
            let orderHistory = OrderHistory()
            let data = item.value as! NSDictionary
            orderHistory.ReferenceNumber = data["ReferenceNumber"] as! String
            orderHistory.dateAndTime = data["dateAndTime"] as? String
            orderHistory.message = data["message"] as! String
            orderHistoryArray.append(orderHistory)
        }
        
        self.orderHistoryTableView.reloadData()
        
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
