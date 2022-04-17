//
//  ViewController.swift
//  My Project
//
//  Created by  Maria Khamitsevich on 15.04.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var hiddenLabel: UILabel!
    @IBOutlet var confirmButton: UIButton!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var pencilImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 8
        loginTextField.placeholder = "My Login"
        hiddenLabel.text = "Please, enter your login"
        pencilImage.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func makeTouch() {
        if !hiddenLabel.isHidden && hiddenLabel.text == "Please, enter your login" {
            hiddenLabel.text = "Please, enter your password"
            confirmButton.setTitle("Confirm", for: .normal)
            loginTextField.placeholder = "My Password"
            
        } else if !hiddenLabel.isHidden && hiddenLabel.text == "Please, enter your password" {
            hiddenLabel.isHidden = true
            confirmButton.setTitle("Deny", for: .normal)
            loginTextField.placeholder = ""
            loginTextField.isHidden = true
            pencilImage.isHidden = true
        } else {
            hiddenLabel.isHidden = false
            hiddenLabel.text = "Please, enter your login"
            confirmButton.setTitle("Confirm", for: .normal)
            loginTextField.placeholder = "My Login"
            loginTextField.isHidden = false
            pencilImage.isHidden = false
        }
    }
    
}

