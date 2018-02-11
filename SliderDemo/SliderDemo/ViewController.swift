//
//  ViewController.swift
//  SliderDemo
//
//  Created by Nalin on 03/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Label: UILabel!
    @IBOutlet var Slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func ChangeSlider(_ sender: UISlider) {
        // UIFont is inbuild class which accepts 2 parameter as
        // 1. font name and
        // 2. size of font
        Label.font = UIFont(name: "verdana", size: CGFloat(Slider.value))
    }
}

