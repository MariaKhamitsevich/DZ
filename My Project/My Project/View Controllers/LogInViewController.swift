//
//  LogInViewController.swift
//  My Project
//
//  Created by  Maria Khamitsevich on 21.04.22.
//

import UIKit



class LogInViewController: UIViewController {
    
    @IBOutlet var hiddenLabel: UILabel!
    @IBOutlet var confirmButton: UIButton!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var pencilImage: UIImageView!
    @IBOutlet var mainSwitch: UISwitch!
    
    var loginDelegate: ChangeLabelTitle?
    var loginText = "Wellcome"
    
    @IBOutlet var credentialsStackView: UIStackView!
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
    
    override func viewWillDisappear(_ animated: Bool) {
        
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
        if let text = loginTextField.text {
        loginText = text
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
        
        loginDelegate?.changeTitle(title: loginText)
        self.navigationController?.popViewController(animated: true)
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



