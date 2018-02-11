//
//  ViewController.swift
//  URLAction
//
//  Created by Nalin on 04/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var GoToURLButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GoToURLButton.layer.cornerRadius = 15;
        GoToURLButton.layer.borderColor = UIColor.black.cgColor;
        GoToURLButton.layer.borderWidth = 1;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func GoToURL(_ sender: UIButton) {
        let url = NSURL(string:"http://www.google.com")! as URL;
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

