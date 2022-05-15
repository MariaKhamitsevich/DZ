//
//  ProfileView.swift
//  ZooBazaar
//
//  Created by Maria Khamitsevich on 9.05.22.
//

import UIKit
import SnapKit

class ProfileView: UIView, UITextFieldDelegate {
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "launchScreen")
        image.alpha = 0.3
        
        
        return image
    }()
    
    private lazy var registrationSegmentedControl: UISegmentedControl = {
        var segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "Вход", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Регистрация", at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0

                
        return segmentedControl
    }()
    
    private lazy var emailPasswordStack: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(emailTextField)
        stack.addArrangedSubview(passwordTextField)
        stack.axis = .vertical
        stack.spacing = 16
        
        return stack
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .white
        textField.textColor = ColorsManager.zbzbTextColor
        textField.layer.cornerRadius = 4
        textField.becomeFirstResponder()
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        
        return textField
    }()
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.keyboardType = .numbersAndPunctuation
        textField.backgroundColor = .white
        textField.textColor = ColorsManager.zbzbTextColor
        textField.layer.cornerRadius = 4
        textField.becomeFirstResponder()
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorsManager.zbzbBackgroundColor
        addSubview(logoImageView)
        addSubview(registrationSegmentedControl)
        addSubview(emailPasswordStack)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.addTarget(self, action: #selector(pressReturn), for: .primaryActionTriggered)
        passwordTextField.addTarget(self, action: #selector(pressReturn), for: .primaryActionTriggered)
        setAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setAllConstraints() {
        self.logoImageView.snp.updateConstraints { make in
            make.top.equalTo(self.snp.topMargin)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalTo(self.snp.bottomMargin)
        }
        
        self.registrationSegmentedControl.snp.updateConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(24)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        self.emailPasswordStack.snp.updateConstraints { make in
            make.top.equalTo(registrationSegmentedControl.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func pressReturn() {
        self.endEditing(true)
    }
}
