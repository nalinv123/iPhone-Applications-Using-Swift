//
//  ViewController.swift
//  Browser
//
//  Created by Nalin on 11/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController{

    @IBOutlet var SearchBar: UISearchBar!
    @IBOutlet var WebView: UIWebView!
    @IBOutlet var ActInd: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SearchBar.text = "http://"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(_ searchbar: UISearchBar)
    {
        SearchBar.resignFirstResponder()
        
        let text = SearchBar.text;
        let url = URL(string: text!)
        let request = URLRequest(url: url!)
        
        WebView.loadRequest(request)
    }
    
    func webViewDidStartLoad(_ : UIWebView) {
        ActInd.startAnimating()
    }
    
    func webViewDidFinishLoad(_ : UIWebView) {
        ActInd.stopAnimating()
    }
}

