//
//  ViewController.swift
//  EventDemo
//
//  Created by Nalin on 30/01/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Label: UILabel!
    @IBOutlet var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Button.backgroundColor = .clear;
        Button.layer.cornerRadius = 5;
        Button.layer.borderWidth = 1;
        Button.layer.borderColor = UIColor.black.cgColor;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ButtonClick(_ sender: UIButton) {
        Label.text = "Hello World from Nalin";
    }
    
}

