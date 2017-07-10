//
//  LoadProductList.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 10/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import Foundation
import Alamofire

class LoadProductList {
    
    private var _serverResponse: String!
    
    //avoid the empty-value crash
    
    var serverResponse: NSDictionary!
    
    func loadList (shopId: Int, completed: @escaping () -> ()) {
        let parameters: Parameters = [
            "shopId" : shopId,
            ]
        
        Alamofire.request(PRODUCT_LIST_URL, method: .post, parameters: parameters).responseJSON {
            response in
            //printing response
            print(response)
            
            switch response.result {
                
            case .success(let value):
                
                self.serverResponse = value as! NSDictionary
                
            case .failure(let error):
                
                self._serverResponse = "Error 4xx / 5xx: \(error)"
            }
            
            completed()
        }
    }

}
