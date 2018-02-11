//
//  NextViewController.swift
//  LoginApp
//
//  Created by Nalin on 02/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet var Logout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Logout.layer.cornerRadius = 15;
        Logout.layer.borderWidth = 1;
        Logout.layer.borderColor = UIColor.black.cgColor;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DoLogout(_ sender: UIButton) {
        
        //login to switch from profile view (NextViewController) to login view(ViewController)
        
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController;
        self.navigationController?.pushViewController(loginViewController, animated: true);
        
        self.dismiss(animated: false, completion: nil);
    }
}
