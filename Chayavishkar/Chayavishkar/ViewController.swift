//
//  ViewController.swift
//  Chayavishkar
//
//  Created by Nalin on 15/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tfUsername: UITextField!
    @IBOutlet var tfPassword: UITextField!
    @IBOutlet var btLogin: UIButton!
    @IBOutlet var lForgotPassword: UILabel!
    @IBOutlet var lSignUp: UILabel!
    @IBOutlet var actInd: UIActivityIndicatorView!
    var Alert = UIAlertController();
    var userDefaults = UserDefaults.standard;
    
    override func viewDidLoad() {
        //if User is logged in then directly load UserProfileView
        if (userDefaults.bool(forKey: "isLoggedIn"))
        {
            let UserProfileTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserProfileTabViewController") as! UserProfileTabViewController
            self.navigationController?.pushViewController(UserProfileTabViewController, animated: true)
            self.dismiss(animated: false, completion: nil)
        }
        
        super.viewDidLoad()
        btLogin.layer.cornerRadius = 15
        btLogin.layer.borderWidth = 1
        btLogin.layer.borderColor = UIColor.black.cgColor
        
        //This code is used to make a UILabel clickable
        let tapForgotPassword = UITapGestureRecognizer(target: self, action: #selector(ViewController.loadForgotPasswordView))
        lForgotPassword.addGestureRecognizer(tapForgotPassword)
        
        let tapSignUp = UITapGestureRecognizer(target: self, action: #selector(ViewController.loadRegisterView))
        lSignUp.addGestureRecognizer(tapSignUp)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doLogin(_ sender: UIButton) {
        actInd.startAnimating();
        let Username = tfUsername.text;
        let Password = tfPassword.text;
        
        if (Username?.isEmpty)!
        {
            actInd.stopAnimating();
            Alert = Helper.createAlertViewController(Title: "Error", Msg: "Please Enter a Username");
            self.present(Alert, animated: true, completion: nil)
            return;
        }
        else if (Password?.isEmpty)!
        {
            actInd.stopAnimating();
            Alert = Helper.createAlertViewController(Title: "Error", Msg: "Please Enter a Password");
            self.present(Alert, animated: true, completion: nil)
            return;
        }
        
        let url = URL(string: "http://nalinvaidya.16mb.com/userfetchdata.php");
        var request = URLRequest(url: url!);
        request.httpMethod = "POST";
        
        let postString = "username=" + Username! + "&password=" + Password!;
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request)
        {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print(error as Any);
                return;
            }
            
            do
            {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String:Any];
                
                if (jsonResponse["success"] as! Int == 1)
                {
                    DispatchQueue.main.async {
                        self.actInd.stopAnimating();
                        self.userDefaults.set("true", forKey: "isLoggedIn");
                        self.userDefaults.set(jsonResponse["name"], forKey: "name");
                        self.userDefaults.set(jsonResponse["email"], forKey: "email");
                        self.userDefaults.set(jsonResponse["date"], forKey: "dob");
                        //print("Successs");
                        let UserProfileTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserProfileTabViewController") as! UserProfileTabViewController
                        self.navigationController?.pushViewController(UserProfileTabViewController, animated: true)
                        self.dismiss(animated: false, completion: nil)
                    }
                }
                else
                {
                    DispatchQueue.main.async {
                        self.actInd.stopAnimating();
                        self.Alert = Helper.createAlertViewController(Title: "Error", Msg: "Please Enter valid credentials");
                        self.present(self.Alert, animated: true, completion: nil)
                        return;
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
    
    @objc func loadForgotPasswordView(sender:UITapGestureRecognizer)
    {
        let ForgotPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordStoryboard") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(ForgotPasswordViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func loadRegisterView(sender:UITapGestureRecognizer)
    {
        let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpStoryboard") as! SignUpViewController
        self.navigationController?.pushViewController(SignUpViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func doExit(_ sender: UIBarButtonItem) {
        let exitAlertView = UIAlertController(title: "About Exit", message: "Do you really want to exit the application", preferredStyle: .alert)
        let exitAlertAction = UIAlertAction(title: "Yes", style: .default, handler: { _ in exit(0)})
        let cancleAlertAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        exitAlertView.addAction(exitAlertAction)
        exitAlertView.addAction(cancleAlertAction)
        
        self.present(exitAlertView, animated: true, completion: nil)
    }
}

