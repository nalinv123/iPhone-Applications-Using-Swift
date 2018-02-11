//
//  ViewController.swift
//  ShakeGestureDemo
//
//  Created by Nalin on 04/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Due to this function our application becomes the responder
    override var canBecomeFirstResponder: Bool
    {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?)
    {
        if motion == .motionShake
        {
            Label.text = "Marvellous Shake gesture detected"
        }
    }
}

