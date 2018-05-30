//
//  Validation.swift
//  Login_Registration
//
//  Created by Nalin on 04/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import Foundation
import UIKit

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
        let url = URL(string: "http://ekrishi.000webhostapp.com/login.php");
        
        var urlRequest = URLRequest(url: url!);
        
        urlRequest.httpMethod = "POST";
        
        let postString = "Email="+Email+"&Password="+Pass;
        
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8);
        
        URLSession.shared.dataTask(with: urlRequest)
            {
                (data: Data?, response : URLResponse?, err: Error?) in
                if(err != nil)
                {
                    return;
                }
                
                do{
                    let JsonRes = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String : Any];
                    
                    print(JsonRes);
                    
                }
                catch
                {
                    print(error.localizedDescription);
                }
            }
            .resume();
        
        return false;
    }
    static func register(Name:String,Email:String,Password:String,Mobile:String,City:String,Addr:String) -> Bool
    {
        //
        //  Connect
        //
        return true;
    }
    
    static func displayAlart(title:String, message:String) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let Al_Action = UIAlertAction(title: "Ok", style: .cancel, handler: nil);
        
        alert.addAction(Al_Action);
        
        return alert;
    }
}
