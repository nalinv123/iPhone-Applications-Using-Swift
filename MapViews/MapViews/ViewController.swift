//
//  ViewController.swift
//  MapViews
//
//  Created by Nalin on 08/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var MapView: MKMapView!
    @IBOutlet var SegmentMapType: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectMapType(_ sender: UISegmentedControl) {
        if SegmentMapType.selectedSegmentIndex == 0 {
            MapView.mapType = MKMapType.standard
        }
        else if SegmentMapType.selectedSegmentIndex == 1
        {
            MapView.mapType = MKMapType.satellite
        }
        else if SegmentMapType.selectedSegmentIndex == 2
        {
            MapView.mapType = MKMapType.hybrid
        }
    }
    
}

