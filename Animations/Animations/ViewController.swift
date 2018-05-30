//
//  ViewController.swift
//  Animations
//
//  Created by Nalin on 14/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btStartAnimation: UIButton!
    @IBOutlet var imAnimationImage: UIImageView!
    var iCnt = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startAnimation(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 0.5,
                             target: self,
                             selector: #selector(playAnimation),
                             userInfo: nil,
                             repeats: true)
    }
    
    @objc func playAnimation()
    {
        iCnt += 1
        if iCnt == 4
        {
            iCnt = 1;
        }
        
        imAnimationImage.image = UIImage(named: "Ani\(iCnt).tiff")
    }
    
}

