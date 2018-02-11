//
//  ViewController.swift
//  UserInputDemo
//
//  Created by Nalin on 31/01/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Name: UITextField!
    @IBOutlet var btClick: UIButton!
    @IBOutlet var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btClick.layer.cornerRadius = 5;
        btClick.layer.borderWidth = 1;
        btClick.layer.borderColor = UIColor.black.cgColor;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ButtonPressed(_ sender: UIButton) {
        var name = String();
        name = Name.text!;
        
        labelName.text = "Your name : \(name)";
    }
    
}

