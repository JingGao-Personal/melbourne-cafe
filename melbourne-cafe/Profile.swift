//
//  Profile.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 1/6/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import Foundation
import Alamofire

class Profile {
    private var _serverResponse: String!
    
    //avoid the empty-value crash
    
    var serverResponse: NSDictionary!
    
    func myProfile (email: String, completed: @escaping () -> ()) {
        let parameters: Parameters = [
            "Email" : email,
        ]
        
        Alamofire.request(PROFILE_URL, method: .post, parameters: parameters).responseJSON {
            response in
            //printing response
            print(response)
            
            switch response.result {
                
            case .success(let value):
                //converting it as NSDictionary
//                let jsonData = value as! NSDictionary
                self.serverResponse = value as! NSDictionary
                
                //display the message in label
//                self._serverResponse = jsonData.value(forKey: "message") as! String?
                
            case .failure(let error):
                
                self._serverResponse = "Error 4xx / 5xx: \(error)"
            }
            
            completed()
        }
    }
}
