//
//  ViewController.swift
//  My Project
//
//  Created by  Maria Khamitsevich on 15.04.22.
//

import UIKit

// 5. Создать навигационный флоу из трех экранов и навигироваться из кода. Навигация разного типа: презент и пуш
// 6. Добавить таб-бар на ваш экран и поддержать в нем навигацию.


class ViewController: UIViewController {

    @IBOutlet var hiddenLabel: UILabel!
    @IBOutlet var confirmButton: UIButton!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var pencilImage: UIImageView!
    @IBOutlet var mainSwitch: UISwitch!
    
    @IBOutlet var credentialsStackView: UIStackView!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmButton.layer.cornerRadius = 8
        loginTextField.placeholder = "My Login"
        passwordTextField.placeholder = "Password"
        hiddenLabel.text = "Please, enter your login!"
        hiddenLabel.textColor = UIColor(white: 0.5, alpha: 0.5)
        confirmButton.setTitle("Log In", for: .normal)
        pencilImage.isHidden = false
        loginTextField.backgroundColor = UIColor(red: 251/251, green: 0, blue: 0, alpha: 0.1)
        passwordTextField.backgroundColor = UIColor(red: 251/251, green: 0, blue: 0, alpha: 0.1)
        mainSwitch.isOn = false
        // Do any additional setup after loading the view.
    }
 
    func enableTextFields(_ isEnabled: Bool) {
        for subview in credentialsStackView.subviews {
            if let subview = subview as? UITextField {
                subview.isEnabled = isEnabled
//                subview.isUserInteractionEnabled = false
            }
        }
    }
// MARK: Enter login in textField
    //Begin enter login
    @IBAction func beginEnterLogin(_ sender: UITextField) {
        enableTextFields(mainSwitch.isOn)
    }
    
    //Continue enter login
    @IBAction func enterLogin(_ sender: UITextField) {
        self.loginTextField.becomeFirstResponder()
        if let text = loginTextField.text {
        hiddenLabel.text = "Wellcome, \(text)!"
            hiddenLabel.textColor = UIColor(white: 0, alpha: 1)
        }
        passwordTextField.isEnabled = true
        passwordTextField.text = ""
        
        if loginTextField.text == "" {
            passwordTextField.text = ""
            passwordTextField.isEnabled = false
            hiddenLabel.text = "Please, enter your login!"
            hiddenLabel.textColor = UIColor(white: 0.5, alpha: 0.5)
        }
    }
  
    //Press return button
    @IBAction func loginTextFieldTapDown(_ sender: UITextField) {
        sender.endEditing(true)
    }
// MARK: Enter password in textField
    //Begin enter password
    @IBAction func beginEnterPassword(_ sender: UITextField) {
        if loginTextField.text == "" {
            passwordTextField.isEnabled = false
        } else {
            passwordTextField.isEnabled = true
        }
    }
    
    //Continue enter password
    @IBAction func enterPassword(_ sender: UITextField) {
        self.passwordTextField.becomeFirstResponder()
//        passwordTextField.clearsOnBeginEditing = true
        if loginTextField.text == "" {
            passwordTextField.isEnabled = false
        } else {
            passwordTextField.isEnabled = true
        }
        
        if var text = passwordTextField.text  {
            if text.count > 12 {
                text.removeLast()
                passwordTextField.text = text
            }
        }
    }
    //Press return button
    @IBAction func passwordTextFieldTapDown(_ sender: UITextField) {
        sender.endEditing(true)
    }
// MARK: Switch isOn
    
    @IBAction func changeValueSwith(_ sender: UISwitch) {
        
        if !sender.isOn {
            loginTextField.text = ""
            passwordTextField.text = ""
        }
        
        enableTextFields(sender.isOn)
    }

    // MARK: Confirm Button Action
    //Press Confirm button
    @IBAction func makeTouch() {

    }
    
}

