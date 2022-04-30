//
//  SettingsViewController.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 27.04.22.
//

import UIKit

protocol SetColorsValues: AnyObject{
    func setColorsValues(red: Float, green: Float, blue: Float)
}


class SettingsViewController: UIViewController {
    
    var redValue: Float = 0
    var greenValue: Float = 0
    var blueValue: Float = 0
    weak var backgroundDelegate: SetBackgroundColor?
    weak var colorsValuesDelegate: SetValuesForSliders?
    
    
    override func loadView() {
        view = SettingsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            }
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let controllerSet = SettingsView()
        controllerSet.colorsDelegate = self
        colorsValuesDelegate?.setValues(red: redValue, green: greenValue, blue: blueValue)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        backgroundDelegate?.setBackgroundColor(
            red: redValue,
            green: greenValue,
            blue: blueValue,
            alpha: 1)
    }
    

}


extension SettingsViewController: SetColorsValues {
    
    func setColorsValues(red: Float, green: Float, blue: Float) {
        redValue = red
        greenValue = green
        blueValue = blue
    }

}
