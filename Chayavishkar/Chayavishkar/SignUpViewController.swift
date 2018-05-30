//
//  SignUpViewController.swift
//  Chayavishkar
//
//  Created by Nalin on 16/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfUsername: UITextField!
    @IBOutlet var tfPassword: UITextField!
    @IBOutlet var dpDOB: UIDatePicker!
    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var tfPhoneno: UITextField!
    @IBOutlet var btSignUp: UIButton!
    @IBOutlet var actInd: UIActivityIndicatorView!
    var Alert = UIAlertController();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btSignUp.layer.cornerRadius = 15
        btSignUp.layer.borderWidth = 1
        btSignUp.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doRegister(_ sender: Any) {
        let Name = tfName.text;
        let Username = tfUsername.text;
        let Password = tfPassword.text;
        
        let dateFormatter = DateFormatter();
        dateFormatter.dateStyle = DateFormatter.Style.short;
        let DOB = dateFormatter.string(from: dpDOB.date);
        
        let Email = tfEmail.text;
        let Phone = tfPhoneno.text;
        
        if (Name?.isEmpty)!
        {
            Alert = Helper.createAlertViewController(Title: "Error", Msg: "Please Enter a Name");
            self.present(Alert, animated: true, completion: nil)
            return;
        }
        else if (Username?.isEmpty)!
        {
            Alert = Helper.createAlertViewController(Title: "Error", Msg: "Please Enter a Username");
            self.present(Alert, animated: true, completion: nil)
            return;
        }
        else if (Password?.isEmpty)!
        {
            Alert = Helper.createAlertViewController(Title: "Error", Msg: "Please Enter a Password");
            self.present(Alert, animated: true, completion: nil)
            return;
        }
        else if (Email?.isEmpty)!
        {
            Alert = Helper.createAlertViewController(Title: "Error", Msg: "Please Enter a Email");
            self.present(Alert, animated: true, completion: nil)
            return;
        }
        else if (Phone?.isEmpty)!
        {
            Alert = Helper.createAlertViewController(Title: "Error", Msg: "Please Enter a Phone number");
            self.present(Alert, animated: true, completion: nil)
            return;
        }
        else if (!Helper.validateEmail(email: Email!))
        {
            Alert = Helper.createAlertViewController(Title: "Error", Msg: "Please Enter a valid Email");
            self.present(Alert, animated: true, completion: nil)
            return;
        }
        
        let url = URL(string: "http://nalinvaidya.16mb.com/register.php");
        var request = URLRequest(url: url!);
        request.httpMethod = "POST";
        
        var postString = "name=" + Name! + "&username=" + Username!;
        postString += "&password=" + Password! + "&date=" + DOB;
        postString += "&email=" + Email! + "&phnno=" + Phone!;
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request)
        {
            (data:Data?, response:URLResponse?, error:Error?) in
            
            if error != nil
            {
                print(error as Any);
                return;
            }
            
            do
            {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String:Any]
                //print(jsonResponse);
                if (jsonResponse["result"] as! String == "success")
                {
                    DispatchQueue.main.async {
                        self.Alert = Helper.createAlertViewController(Title: "Success", Msg: "You have successfully Registered");
                        self.present(self.Alert, animated: true, completion: nil);
                    }
                }
                else
                {
                    DispatchQueue.main.async {
                        self.Alert = Helper.createAlertViewController(Title: "Sorry", Msg: "oops! Please try again!");
                        self.present(self.Alert, animated: true, completion: nil);
                    }
                }
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
        task.resume();
    }
}
