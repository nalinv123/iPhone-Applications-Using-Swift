//
//  ViewController.swift
//  UIWebViews
//
//  Created by Nalin on 08/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import WebKit

class ViewController: UIViewController, WKNavigationDelegate{

    @IBOutlet var WebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://www.google.com")!
        let request = URLRequest(url: url)
        WebView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

