//
//  ProfileViewController.swift
//  Chayavishkar
//
//  Created by Nalin on 17/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet var lName: UILabel!
    @IBOutlet var lEmail: UILabel!
    @IBOutlet var lBirthDate: UILabel!
    var userDefaults = UserDefaults.standard;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userDefaults.bool(forKey: "isLoggedIn") {
            lName.text = "Name : " + userDefaults.string(forKey: "name")!;
            lEmail.text = "Email : " + userDefaults.string(forKey: "email")!;
            lBirthDate.text = "Date Of Birth : " + userDefaults.string(forKey: "dob")!;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
