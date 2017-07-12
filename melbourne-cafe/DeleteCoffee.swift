//
//  DeleteCoffee.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 12/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import Foundation
import Alamofire

class DeleteCoffee {
    private var _serverResponse: String!
    
    var serverResponse: String {
        get {
            if _serverResponse == nil {
                _serverResponse = ""
            }
            
            return _serverResponse
        }
    }
    
    func deleteCoffee(shopId: Int, name: String, completed: @escaping () -> ()) {
        
        let parameters: Parameters = [
            "shopId": shopId,
            "name": name,
        ]
        
        
        Alamofire.request(DELETE_COFFEE_URL, method: .post, parameters: parameters).responseJSON {
            response in
            
            print(response)
            
            if let result = response.result.value {
                
                //converting it as NSDictionary
                let jsonData = result as! NSDictionary
                
                //display the message in label
                self._serverResponse = jsonData.value(forKey: "message") as! String?
                print(self._serverResponse)
            }
            completed()
            
        }
    }

}
