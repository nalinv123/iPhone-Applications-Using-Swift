//
//  UserProfileTabViewController.swift
//  Chayavishkar
//
//  Created by Nalin on 10/03/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class UserProfileTabViewController: UITabBarController {
    
    var userDefaults = UserDefaults.standard;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //to hide back button from the navigation bar after login
        self.navigationItem.hidesBackButton = true;
        
        let logoutButton = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showLogoutAlert));
        
        self.navigationItem.rightBarButtonItem = logoutButton;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showLogoutAlert()
    {
        let Alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout", preferredStyle: .alert);
        let yes = UIAlertAction(title: "Yes", style: .default, handler: {(action: UIAlertAction) in self.doLogout()});
        let no = UIAlertAction(title: "No", style: .cancel, handler: nil);
        Alert.addAction(yes);
        Alert.addAction(no)
        self.present(Alert, animated: true, completion: nil);
    }
    
    func doLogout()
    {
        print("LogOut");
        userDefaults.set("false", forKey: "isLoggedIn");
        let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! ViewController
        self.navigationController?.pushViewController(ViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
}
