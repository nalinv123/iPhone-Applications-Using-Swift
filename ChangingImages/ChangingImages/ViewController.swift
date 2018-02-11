//
//  ViewController.swift
//  ChangingImages
//
//  Created by Nalin on 10/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bt1: UIButton!
    @IBOutlet var bt2: UIButton!
    @IBOutlet var bt3: UIButton!
    @IBOutlet var bt4: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadImage1(_ sender: UIButton) {
        let image:UIImage = UIImage(named: "denis.jpg")!;
        imageView.image = image
    }
    
    @IBAction func loadImage2(_ sender: UIButton) {
        let image:UIImage = UIImage(named: "stevejobs.jpeg")!;
        imageView.image = image
    }
    
    @IBAction func loadImage3(_ sender: UIButton) {
        let image = UIImage(named: "billgates.jpg")
        imageView.image = image;
    }
    
    @IBAction func loadImage4(_ sender: UIButton) {
        let image:UIImage = UIImage(named: "linustorvald.jpg")!;
        imageView.image = image
    }
}

