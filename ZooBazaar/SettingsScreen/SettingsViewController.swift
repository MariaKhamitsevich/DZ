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
        
        if let view = view as? SettingsView {
            for subview in view.colorSlidersStack.subviews {
                if let subview = subview as? UISlider {
                    subview.addTarget(self, action: #selector(slidersAction), for: .valueChanged)
                }
            }
        }
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
    private func setColor() {
        if let view = view as? SettingsView {
            view.backgroundColor = UIColor(
                red: CGFloat(view.redSlider.value / 255),
                green: CGFloat(view.greenSlider.value / 255),
                blue: CGFloat(view.blueSlider.value / 255),
                alpha: 1)
        }
    }
    
    @objc func slidersAction(_ sender: Any) {
        guard let slider = sender as? UISlider else { return }
        
        setColor()
        if let view = view as? SettingsView {
            switch slider.tag {
            case 0: view.redValueLabel.text = String(Int(view.redSlider.value))
            case 1: view.greenValueLabel.text = String(Int(view.greenSlider.value))
            case 2: view.blueValueLabel.text = String(Int(view.blueSlider.value))
            default: break
            }
        }
    }

}
