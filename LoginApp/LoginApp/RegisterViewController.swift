//
//  RegisterViewController.swift
//  LoginApp
//
//  Created by Nalin on 01/03/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfAddress: UITextField!
    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var tfPassword: UITextField!
    @IBOutlet var btRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doRegistration(_ sender: UIButton) {
        let Name = tfName.text;
        let Address = tfAddress.text;
        let Email = tfAddress.text;
        let Password = tfPassword.text;
        var alert:UIAlertController = UIAlertController();
        
        if (Name?.isEmpty)! {
            alert = AlertView.createAlertViewController(Title: "Sorry", Msg: "Pleae Enter Name");
            self.present(alert, animated: true, completion: nil);
        }
        else if (Address?.isEmpty)! {
            alert = AlertView.createAlertViewController(Title: "Sorry",Msg: "Please Enter Address");
            self.present(alert, animated: true, completion: nil);
        }
        else if (Email?.isEmpty)! {
            alert = AlertView.createAlertViewController(Title: "Sorry",Msg: "Please Enter Email Address");
            self.present(alert, animated: true, completion: nil);
        }
        else if (Password?.isEmpty)! {
            alert = AlertView.createAlertViewController(Title: "Sorry",Msg: "Please Enter Password");
            self.present(alert, animated: true, completion: nil);
        }
        else {
            let postString = "Name=" + Name! + "&Address=" + Address! + "&Email=" + Email! + "&Password=" + Password!;
            let url = URL(string : "http://192.168.1.5/LoginAndRegister/Register.php");
            var request = URLRequest(url: url!)
            request.httpMethod = "POST";
            
            request.httpBody = postString.data(using: String.Encoding.utf8);
            
            let task = URLSession.shared.dataTask(with: request)
            {
                (data: Data?, response: URLResponse?, error: Error?) in
                
                if error != nil
                {
                    print(error ?? "");
                    return;
                }
                
                do
                {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String:Any];
                    if (json["result"] as! String == "Sucess")
                    {
                        DispatchQueue.main.async {
                            alert = AlertView.createAlertViewController(Title: "Sucess", Msg: "You have successfully Registered");
                            self.present(alert, animated: true, completion: nil);
                        }
                    }
                    else
                    {
                        DispatchQueue.main.async {
                            alert = AlertView.createAlertViewController(Title: "Failure", Msg: "There is a problem in registration");
                            self.present(alert, animated: true, completion: nil);
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
}
