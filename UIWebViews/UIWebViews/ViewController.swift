//
//  ViewController.swift
//  UIWebViews
//
//  Created by Nalin on 08/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import WebKit

class ViewController: UIViewController, WKNavigationDelegate{

    var WebView: WKWebView!
    
    override func loadView() {
        WebView = WKWebView()
        WebView.navigationDelegate = self
        view = WebView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://www.google.com")!
        WebView.load(URLRequest(url: url))
        WebView.allowsBackForwardNavigationGestures = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

