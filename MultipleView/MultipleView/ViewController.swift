//
//  ViewController.swift
//  MultipleView
//
//  Created by Nalin on 01/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var NextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NextButton.layer.cornerRadius = 15;
        NextButton.layer.borderWidth = 1;
        NextButton.layer.borderColor = UIColor.black.cgColor;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

