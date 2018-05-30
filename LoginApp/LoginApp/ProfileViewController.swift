//
//  NextViewController.swift
//  LoginApp
//
//  Created by Nalin on 02/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var Logout: UIButton!
    @IBOutlet var lWelcomeMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Logout.layer.cornerRadius = 15;
        Logout.layer.borderWidth = 1;
        Logout.layer.borderColor = UIColor.black.cgColor;
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil);
        navigationItem.leftBarButtonItem = backButton;
        
        let defaultValues = UserDefaults.standard;
        let Name = defaultValues.string(forKey: "Name");
        lWelcomeMessage.text = "Welcome " + Name!;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DoLogout(_ sender: UIButton) {
        
        //removing values from defaultValues
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!);
        UserDefaults.standard.synchronize();
        
        //login to switch from profile view (NextViewController) to login view(ViewController)
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController;
        self.navigationController?.pushViewController(loginViewController, animated: true);
        
        self.dismiss(animated: false, completion: nil);
    }
}
