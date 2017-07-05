//
//  LoadCoffee.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 5/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import Foundation
import Alamofire

class CreateCoffee {
    private var _serverResponse: String!
    
    
    //avoid the empty-value crash
    
    var serverResponse: String {
        get {
            if _serverResponse == nil {
                _serverResponse = ""
            }
            
            return _serverResponse
        }
    }
    
    func addCoffee (shopId: Int, name: String, largePrice: Double, mediumPirce: Double, smallPrice: Double, imagePath: String, completed: @escaping () -> ()) {
        
        
        let parameters: Parameters=[
            "shopId" : shopId,
            "name" : name,
            "largePrice" : largePrice,
            "mediumPrice" : mediumPirce,
            "smallPrice" : smallPrice,
            "imagePath" : imagePath
        ]
        
        //Sending http post request
        Alamofire.request(REGISTER_URL, method: .post, parameters: parameters).responseJSON {
            
            response in
            //printing response
            print(response)
            
            //getting the json value from the server
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
