//
//  ViewController.swift
//  SegmentDemo
//
//  Created by Nalin on 03/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Segment: UISegmentedControl!
    @IBOutlet var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let index = Segment.selectedSegmentIndex;
        
        switch index {
        case 0:
            Label.text = "You have selected PPA batch";
        case 1:
            Label.text = "You have selected LB batch";
        case 2:
            Label.text = "You have selected UNIX batch";
        case 3:
            Label.text = "You have selected MultiOS batch";
        default:
            NSLog("a")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func SegementSelected(_ sender: UISegmentedControl) {
        let index = Segment.selectedSegmentIndex;
        
        switch index {
        case 0:
            Label.text = "You have selected PPA batch";
        case 1:
            Label.text = "You have selected LB batch";
        case 2:
            Label.text = "You have selected UNIX batch";
        case 3:
            Label.text = "You have selected MultiOS batch";
        default:
            NSLog("a")
        }
    }
}

