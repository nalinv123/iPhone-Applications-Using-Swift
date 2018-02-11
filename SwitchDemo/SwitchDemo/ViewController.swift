//
//  ViewController.swift
//  SwitchDemo
//
//  Created by Nalin on 03/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Switch: UISwitch!
    @IBOutlet var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if Switch.isOn {
            Label.text = "Switch is On"
        }
        else {
            Label.text = "Switch is Off"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SwitchPressed(_ sender: UISwitch) {
        if Switch.isOn {
            Label.text = "Switch is On"
        }
        else {
            Label.text = "Switch is Off"
        }
    }
    
}

