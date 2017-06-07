//
//  Login.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 30/5/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import Foundation
import Alamofire
import SwiftHash

class Login {
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
    
    func userLogin (email: String, password: String, completed: @escaping () -> ()) {
        
        //using MD5 password
        let pwdHash = MD5(password)
        
        //creating parameters for the post request
        let parameters: Parameters=[
            "Password" : pwdHash,
            "Email" : email,
            ]
        
        //Sending http post request
        Alamofire.request(LOGIN_URL, method: .post, parameters: parameters).responseJSON {
            
            response in
            //printing response
            print(response)
            
            switch response.result {
                
            case .success(let value):
                
                //converting it as NSDictionary
                let jsonData = value as! NSDictionary
                
                //display the message in label
                self._serverResponse = jsonData.value(forKey: "message") as! String?
                
            case .failure(let error):
                
                self._serverResponse = "Error 4xx / 5xx: \(error)"
            }
            
            completed()
            
        }
        
        
    }
}



