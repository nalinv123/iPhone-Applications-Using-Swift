//
//  FirstViewController.swift
//  Login_Registration
//
//  Created by Nalin on 03/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var Log_email: UITextField!
    @IBOutlet var Log_pass: UITextField!
    @IBOutlet var Login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Ekrishi_Login(_ sender: UIButton)
    {
        let email = Log_email.text;
        let pass = Log_pass.text;
        
        
        if((email?.isEmpty)! || (pass?.isEmpty)!)
        {
            let alert = UIAlertController(title: "Sorry", message: "Please enter login credentials", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default	, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
        else
        {
            if(!Validation.emailValidation(Email: email!))
            {
                let alert = UIAlertController(title: "Sorry", message: "Please enter valid email", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default    , handler: nil)
                alert.addAction(alertAction)
                present(alert, animated: true, completion: nil)
                Log_email.text = "";
                Log_pass.text = "";
            }
        }
        
    }
    
}

