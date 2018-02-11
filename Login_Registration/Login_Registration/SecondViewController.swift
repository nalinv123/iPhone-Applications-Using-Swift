//
//  SecondViewController.swift
//  Login_Registration
//
//  Created by Nalin on 03/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    

    @IBOutlet var Reg_Name: UITextField!
    @IBOutlet var Reg_Email: UITextField!
    @IBOutlet var Reg_Mobile: UITextField!
    @IBOutlet var Reg_Addr: UITextField!
    @IBOutlet var Reg_City: UIPickerView!
    @IBOutlet var Register: UIButton!
    @IBOutlet var Reg_Pass: UITextField!
    let cities = ["Pune","Mumbai","Nagpur"];

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Reg_City.delegate = self
        Reg_City.dataSource = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return cities[row];
    }


    @IBAction func Ekrishi_Register(_ sender: Any)
    {
        let name = Reg_Name.text;
        let email = Reg_Email.text;
        let pass = Reg_Pass.text;
        let mobile = Reg_Mobile.text;
        let addr = Reg_Addr.text;
        
        if((email?.isEmpty)! || (pass?.isEmpty)! || (mobile?.isEmpty)! || (addr?.isEmpty)!)
        {
            let alert = UIAlertController(title: "Sorry", message: "Please enter valid registration credentials", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default    , handler: nil)
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
                Reg_Email.text = "";
                Reg_Pass.text = "";
            }
            else if(!Validation.passValidate(Pass: pass!))
            {
                let alert = UIAlertController(title: "Sorry", message: "Please enter valid password", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default    , handler: nil)
                alert.addAction(alertAction)
                present(alert, animated: true, completion: nil)
                Reg_Pass.text = "";
            }
            else if(!Validation.mobileValidate(Mobile: mobile!))
            {
                let alert = UIAlertController(title: "Sorry", message: "Please enter valid mobile number", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default    , handler: nil)
                alert.addAction(alertAction)
                present(alert, animated: true, completion: nil)
                Reg_Mobile.text = "";
            }
            else
            {
                if(!Validation.register(Name: name!, Email: email!, Password: pass!, Mobile: mobile!, City: name!, Addr: addr!))
                {
                    let alert = UIAlertController(title: "Sorry", message: "unable to register", preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .default    , handler: nil)
                    alert.addAction(alertAction)
                    present(alert, animated: true, completion: nil)
                    Reg_Mobile.text = "";
                    Reg_Name.text = "";
                    Reg_Addr.text = "";
                    Reg_Pass.text = "";
                    Reg_Email.text = "";
                }
            }
        }
        
        
    }
    
}

