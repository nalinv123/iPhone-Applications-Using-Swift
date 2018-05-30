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
    
    var alert = UIAlertController();
    
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
                return
            }
            
            if((Validation.login(Email: email!, Pass: pass!)))
            {
                // next view
                let addProductCnt = self.storyboard?.instantiateViewController(withIdentifier: "addProduct") as! addProduct;
                
                // display it on view
                self.present(addProductCnt, animated: true, completion: nil);
                self.dismiss(animated: true, completion: nil);
                // completion: you can pass any method, which will call after completing this view.
            }
            else
            {
                alert = Validation.displayAlart(title: "Login Failed", message: "Unable to Login");
                
                // present is used for displaying any view on screen
                self.present(alert, animated: true, completion: nil);       // this=>self
            }
            
        }
    }
}

