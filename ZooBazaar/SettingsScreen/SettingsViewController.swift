//
//  SettingsViewController.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 27.04.22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var redValue: Float = 0
    var greenValue: Float = 0
    var blueValue: Float = 0
    weak var backgroundDelegate: SetBackgroundColor?
    
    override func loadView() {
        view = SettingsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let view = view as? SettingsView {
            view.redSlider.value = redValue
            view.greenSlider.value = greenValue
            view.blueSlider.value = blueValue
            view.redValueLabel.text = String(Int(view.redSlider.value))
            view.greenValueLabel.text = String(Int(view.greenSlider.value))
            view.blueValueLabel.text = String(Int(view.blueSlider.value))
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let view = view as? SettingsView {
            backgroundDelegate?.setBackgroundColor(
                red: view.redSlider.value,
                green: view.greenSlider.value,
                blue: view.blueSlider.value,
                alpha: 1)
            
        }
    }
}
