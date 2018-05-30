//
//  ViewController.swift
//  DelayedActionDemo
//
//  Created by Nalin on 11/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btClick: UIView!
    @IBOutlet var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 5,
                                         target: self,
                                         selector: #selector(fun),
                                         userInfo: nil,
                                         repeats: false)
    }
    
    @objc func fun()
    {
        labelResult.text = "Action is taken after 5 seconds";
    }
}

