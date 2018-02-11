//
//  ViewController.swift
//  Music
//
//  Created by Nalin on 09/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var btPlay: UIButton!
    @IBOutlet var btStop: UIButton!
    var bombSoundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "Dimitri Vegas and Like Mike ft Wolfpack - Ocarina (TomorrowWorld Anthem).mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
    
        do
        {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
        }
        catch
        {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playMusic(_ sender: UIButton) {
        bombSoundEffect?.play()
    }
    
    @IBAction func stopMusic(_ sender: UIButton) {
        bombSoundEffect?.pause()
    }
}

