//
//  ForgotPasswordViewController.swift
//  Chayavishkar
//
//  Created by Nalin on 16/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var btReset: UIButton!
    var Alert:UIAlertController = UIAlertController();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btReset.layer.cornerRadius = 15
        btReset.layer.borderWidth = 1
        btReset.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doForgotPasswordRequest(_ sender: UIButton) {
        let Email = tfEmail.text;
        
        if (Email?.isEmpty)!
        {
            Alert = Helper.createAlertViewController(Title: "Error", Msg: "Please Enter Email");
            self.present(Alert, animated: true, completion: nil);
            return;
        }
        if (!Helper.validateEmail(email: Email!))
        {
            Alert = Helper.createAlertViewController(Title: "Error", Msg: "Please Enter Valid Email");
            self.present(Alert, animated: true, completion: nil);
            return;
        }
        
        let url = URL(string: "http://nalinvaidya.16mb.com/forgotpassword.php");
        var request = URLRequest(url: url!);
        request.httpMethod = "POST";
        
        let postString = "email=" + Email!;
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request)
        {
            (data: Data!, response: URLResponse!, error: Error!) in
            
            if error != nil
            {
                print(error as! String);
                return;
            }
            
            do
            {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [String:Any];
                DispatchQueue.main.async {
                    self.Alert = Helper.createAlertViewController(Title: "Response", Msg: jsonResponse["result"] as! String);
                    self.present(self.Alert, animated: true, completion: nil);
                }
            }
            catch
            {
                print(error.localizedDescription);
            }
        }
        task.resume();
    }
}
