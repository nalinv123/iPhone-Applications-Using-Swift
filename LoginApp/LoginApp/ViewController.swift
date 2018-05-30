//
//  ViewController.swift
//  LoginApp
//
//  Created by Nalin on 01/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var tfPassword: UITextField!
    @IBOutlet var Login: UIButton!
    @IBOutlet var Attempts: UILabel!
    var iCnt = 3;
    
    //variable to store user data
    //This is like sharedPreference in android which stores values in key-value format
    let defaultValues = UserDefaults.standard;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Login.layer.cornerRadius = 15;
        Login.layer.borderWidth = 1;
        Login.layer.borderColor = UIColor.black.cgColor;
        
        if (defaultValues.string(forKey: "Email") != nil) {
            //logic to switch from login view(ViewController) to profile view(NextViewController)
            let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController;
            //ID of our view(storyboard)-- as! --class_name(controller)
            
            //changing the actual view
            self.navigationController?.pushViewController(profileViewController, animated: true);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DoLogin(_ sender: UIButton) {
        let Email = tfEmail.text;
        let Password = tfPassword.text;
        var alertView:UIAlertController = UIAlertController();
        
        if (Email?.isEmpty)!
        {
            alertView = AlertView.createAlertViewController(Title: "Sorry", Msg: "Please Enter Email")
            self.present(alertView, animated: true, completion: nil)
        }
        else if (Password?.isEmpty)!
        {
            alertView = AlertView.createAlertViewController(Title: "Sorry",Msg: "Please Enter Password");
            self.present(alertView, animated: true, completion: nil);
        }
        else
        {
            let url = URL(string : "http://192.168.1.5/LoginAndRegister/Login.php");
            var request = URLRequest(url: url!);
            let postString = "Email=" + Email! + "&Password=" + Password!;
            
            request.httpMethod = "POST";
            request.httpBody = postString.data(using: String.Encoding.utf8);
            
            let task = URLSession.shared.dataTask(with: request)
            {
                (data : Data?, response : URLResponse?, error : Error?) in
                
                if error != nil{
                    print(error as Any)
                    return;
                }
                
                do
                {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String: Any]
                    if (json["result"] as! String == "Sucess")
                    {
                        DispatchQueue.main.async {
                            
                            //saving user data into UserDefault variable i.e defaultValues variable
                            self.defaultValues.set(json["Name"], forKey: "Name");
                            self.defaultValues.set(json["Email"], forKey: "Email");
                            
                            //logic to switch from login view(ViewController) to profile view(NextViewController)
                            let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController;
                            //  ID of our view(storyboard)-- as! --class_name(controller)
                            
                            self.navigationController?.pushViewController(profileViewController, animated: true);
                            
                            self.dismiss(animated: false, completion: nil);
                        }
                    }
                    else
                    {
                        DispatchQueue.main.async {
                            alertView = AlertView.createAlertViewController(Title: "Failure", Msg: "Please Enter valid credentials");
                            self.present(alertView, animated: true, completion: nil)
                            
                            self.iCnt-=1;
                            self.Attempts.text = "Attempts Remaining : \(self.iCnt)";
                            if (self.iCnt == 0)
                            {
                                self.Login.isEnabled = false;
                            }
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

