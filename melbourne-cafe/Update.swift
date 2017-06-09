//
//  Update.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 8/6/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import Foundation
import Alamofire


class Update {
    private var _serverResponse: String!
    
    var serverResponse: String {
        get {
            if _serverResponse == nil {
                _serverResponse = ""
            }
            
            return _serverResponse
        }
    }
    
    func updateUser(userInfoType: String, updatedUserInfo: String, email: String, completed: @escaping () -> ()) {
       
        let parameters: Parameters = [
            "userInfoType": userInfoType,
            "updatedUserInfo": updatedUserInfo,
            "Email": email
        ]
        
        print(parameters)
        
        Alamofire.request(UPDATE_URL, method: .post, parameters: parameters).responseJSON {
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
