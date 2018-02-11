//
//  ViewController.swift
//  LoginApp
//
//  Created by Nalin on 01/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Username: UITextField!
    @IBOutlet var Password: UITextField!
    @IBOutlet var Login: UIButton!
    @IBOutlet var Attempts: UILabel!
    var iCnt = 3;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Login.layer.cornerRadius = 15;
        Login.layer.borderWidth = 1;
        Login.layer.borderColor = UIColor.black.cgColor;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DoLogin(_ sender: UIButton) {
        let username = Username.text;
        let password = Password.text;
        
        if ((username == "nalin") && (password == "nalin@123"))
        {
            Attempts.text = "Login Successful";
            
            //login to switch from login view(ViewController) to profile view(NextViewController)
            
            let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! NextViewController;
        //  ID of our view(storyboard)-- as! --class name(controller)
            
            self.navigationController?.pushViewController(profileViewController, animated: true);
            
            self.dismiss(animated: false, completion: nil);
        }
        else
        {
            iCnt-=1;
            Attempts.text = "Attempts Remaining : \(iCnt)";
            if (iCnt == 0)
            {
                Login.isEnabled = false;
            }
        }
    }
    
}

