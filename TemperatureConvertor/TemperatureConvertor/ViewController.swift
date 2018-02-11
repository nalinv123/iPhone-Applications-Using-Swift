//
//  ViewController.swift
//  TemperatureConvertor
//
//  Created by Nalin on 06/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var LabelFTemp: UILabel!
    @IBOutlet var SliderTemperature: UISlider!
    @IBOutlet var LabelCTemp: UILabel!
    @IBOutlet var SwitchTemperatureDecider: UISwitch!
    @IBOutlet var LabelConversionType: UILabel!
    @IBOutlet var ButtonConversion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ButtonConversion.layer.cornerRadius = 15
        ButtonConversion.layer.borderWidth = 1
        ButtonConversion.layer.borderColor = UIColor.black.cgColor
        
        if SwitchTemperatureDecider.isOn {
            LabelConversionType.text = "Fahrenheit to Celsius"
            LabelFTemp.text = "Fahrenheit Temperature : \(SliderTemperature.value)"
            LabelCTemp.text = "Celsius Temperature : "
        }
        else
        {
            LabelConversionType.text = "Celsius to Fahrenheit"
            LabelFTemp.text = "Celsius Temperature : \(SliderTemperature.value)"
            LabelCTemp.text = "Fahrenheit Temperature : "
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectConversion(_ sender: UISwitch) {
        if SwitchTemperatureDecider.isOn {
            LabelConversionType.text = "Fahrenheit to Celsius"
            LabelFTemp.text = "Fahrenheit Temperature : \(SliderTemperature.value)"
            LabelCTemp.text = "Celsius Temperature : "
        }
        else
        {
            LabelConversionType.text = "Celsius to Fahrenheit"
            LabelFTemp.text = "Celsius Temperature : \(SliderTemperature.value)"
            LabelCTemp.text = "Fahrenheit Temperature : "
        }
    }
    
    @IBAction func changeTemperature(_ sender: UISlider) {
        LabelFTemp.text = "Fahrenheit Temperature : \(SliderTemperature.value)"
    }
    
    @IBAction func doConversion(_ sender: Any) {
        if SwitchTemperatureDecider.isOn {
            let FTemp = SliderTemperature.value;
            
            LabelFTemp.text = "Fahrenheit Temperature : \(FTemp)"
            
            let CTemp = ((FTemp - 32) * 5)/9
            
            LabelCTemp.text = "Celsius Temperature : \(CTemp)"
        }
        else
        {
            let CTemp = SliderTemperature.value;
            
            LabelFTemp.text = "Celsius Temperature : \(CTemp)"
            
            let FTemp = (CTemp * (9/5)) + 32
            
            LabelCTemp.text = "Fahrenheit Temperature : \(FTemp)"
        }
    }
}

