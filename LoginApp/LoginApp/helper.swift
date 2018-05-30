//
//  helper.swift
//  LoginApp
//
//  Created by Nalin on 02/03/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import Foundation
import UIKit

class Helper
{
    static func createAlertViewController(Title: String, Msg:String) -> UIAlertController {
        let Helper = UIAlertController(title: Title, message: Msg, preferredStyle: .alert);
        let AlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        Helper.addAction(AlertAction);
        
        return Helper;
    }
    
    static func validateEmail(email : String) -> Bool
    {
        let expre = "[A-Za-z0-9.-_]+@[a-z]+.[a-z]{2,3}";
        
        do
        {
            let regexpre = try NSRegularExpression(pattern: expre)
            
            let retReg = regexpre.matches(in: email, range: NSRange(location:0,length:(email.count)))
            
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
}
