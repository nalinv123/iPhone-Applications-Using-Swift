//
//  Validation.swift
//  Login_Registration
//
//  Created by Nalin on 04/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import Foundation

class Validation
{
    static func emailValidation(Email:String) -> Bool
    {
        let expre = "[A-Za-z0-9.-_]+@[a-z]+.[a-z]{2,3}"

        do
        {
            let regexpre = try NSRegularExpression(pattern: expre)
            
            let retReg = regexpre.matches(in: Email, range: NSRange(location:0,length:(Email.count)))
            
            if(retReg.count == 0)                // IF fail to match
            {
                return false;
            }
            
        }
        catch let error as NSError
        {
            print("invalid regex: \(error.localizedDescription)");
        }
        return true;
    }
    
    static func mobileValidate(Mobile:String) -> Bool
    {
        return true;
    }
    static func passValidate(Pass:String) -> Bool
    {
        return true;
    }
    static func login(Email:String,Pass:String) -> Bool
    {
        //
        //  Connect
        //
        return true;
    }
    static func register(Name:String,Email:String,Password:String,Mobile:String,City:String,Addr:String) -> Bool
    {
        //
        //  Connect
        //
        return true;
    }
}
