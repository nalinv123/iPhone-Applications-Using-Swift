//
//  SecondViewController.swift
//  MultipleView
//
//  Created by Nalin on 01/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var PrevButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        PrevButton.layer.cornerRadius = 15;
        PrevButton.layer.borderWidth = 1;
        PrevButton.layer.borderColor = UIColor.black.cgColor;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
