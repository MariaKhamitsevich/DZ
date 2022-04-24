//
//  ContactsViewController.swift
//  My Project
//
//  Created by  Maria Khamitsevich on 21.04.22.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet var telephoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    weak var backgroundDelegate: SetBackgroundColor?
    
    
    var redValue: Float = 0
    

    var greenValue: Float = 0

    var blueValue: Float = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        telephoneLabel.text = "Telephone: +375251111111"
        emailLabel.text = "Email: zoobazaar@zoo.by"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        redSlider.value = redValue
        greenSlider.value = greenValue
        blueSlider.value = blueValue
        redLabel.text = String(Int(redValue))
        greenLabel.text = String(Int(greenValue))
        blueLabel.text = String(Int(blueValue))
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        backgroundDelegate?.setBackgroundColor(red: redSlider.value,
            green: greenSlider.value,
            blue: blueSlider.value,
            alpha: 1)
    }
    
    private func setColor() {
        view.backgroundColor = UIColor(
            red: CGFloat(redSlider.value / 255),
            green: CGFloat(greenSlider.value / 255),
            blue: CGFloat(blueSlider.value / 255),
            alpha: 1)
    }
    
    @IBAction func slidersAction(_ sender: Any) {
        guard let slider = sender as? UISlider else { return }
        
        setColor()
        switch slider.tag {
        case 0: redLabel.text = String(Int(redSlider.value))
        case 1: greenLabel.text = String(Int(greenSlider.value))
        case 2: blueLabel.text = String(Int(blueSlider.value))
        default: break
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
