//
//  ViewController.swift
//  WebServiceDemo
//
//  Created by Nalin on 21/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tfFirstNumber: UITextField!
    @IBOutlet var tfSecondNumber: UITextField!
    @IBOutlet var btAddition: UIButton!
    @IBOutlet var tfResult: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doAddition(_ sender: UIButton) {
        
        let first = tfFirstNumber.text
        let second = tfSecondNumber.text;
        
        if ((first?.isEmpty)! || (second?.isEmpty)!)
        {
            let alert = UIAlertController(title: "Soory", message: "Plase enter both number", preferredStyle: .alert)
            let cancleAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancleAction)
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let url = URL(string: "http://192.168.1.6/add.php")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let postString = "First=" + first! + "&Second=" + second!;
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        activityIndicator.startAnimating()
        
        let task = URLSession.shared.dataTask(with: request)
        {
            (data:Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                }
                print("error : \(String(describing: error))")
                return
            }
            
            do
            {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String: Any]
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.tfResult.text = json["result"] as? String
                }
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}

