//
//  TextCheck.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 28/5/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import Foundation

class TextCheck {
    
    //all the textfields can not be empty
    func checkEmpty(text:String) -> Bool {
        
        if text == "" {
            return false
        } else {
            return true
        }
    }
    
    //check email address legal or not
    func checkEmail(text:String) -> Bool {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
    
    //password and confirmed password should be the same
    func pwdSame(pwd:String, confirmedPwd:String) -> Bool {
        if pwd == confirmedPwd {
            return true
        } else {
            return false
        }
    }
    
    //the length of the password should be >= 7
    func isPwdLength(pwd:String, confirmedPwd:String) -> Bool {
        if pwd.characters.count <= 7 && confirmedPwd.characters.count <= 7 {
            return true
        } else {
            return false
        }
    }
    
    //validate the phone number
    func checkPhone(phone: String) -> Bool {
        
        let PHONE_REGEX = "04\\d{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return phoneTest.evaluate(with: phone)
        
    }
    
    //validate the ABN number
    func checkAbn(abn: String) -> Bool {
        
        let ABN_REGEX = "^(\\d *?){11}$"
        let abnTest = NSPredicate(format: "SELF MATCHES %@", ABN_REGEX)
        return abnTest.evaluate(with: abn)
        
    }
    
    func checkPrice(price: Double) -> Bool {
        let price_REGEX = "^(?:|0|[1-9]\\d*)(?:\\.\\d*)?$"
        let priceTest = NSPredicate(format: "SELF MATCHES %@", price_REGEX)
        return priceTest.evaluate(with: price)
    }
    
}
