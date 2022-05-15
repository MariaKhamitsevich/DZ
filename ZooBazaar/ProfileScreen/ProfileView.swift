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
        textField.placeholder = "E-mail"
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
        textField.placeholder = "Пароль"
        textField.keyboardType = .numbersAndPunctuation
        textField.backgroundColor = .white
        textField.textColor = ColorsManager.zbzbTextColor
        textField.layer.cornerRadius = 4
        textField.becomeFirstResponder()
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        
        return textField
    }()
    
    private lazy var registrationStack: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(nameTextField)
        stack.addArrangedSubview(emailForRegistrationTextField)
        stack.addArrangedSubview(passwordForRegistrationTextField)
        stack.addArrangedSubview(confirmPasswordTextField)
     
        stack.axis = .vertical
        stack.spacing = 16
        
        stack.isHidden = true
        
        return stack
    }()
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Имя"
        textField.keyboardType = .alphabet
        textField.backgroundColor = .white
        textField.textColor = ColorsManager.zbzbTextColor
        textField.layer.cornerRadius = 4
        textField.becomeFirstResponder()
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        
        return textField
    }()
    private lazy var emailForRegistrationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .white
        textField.textColor = ColorsManager.zbzbTextColor
        textField.layer.cornerRadius = 4
        textField.becomeFirstResponder()
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        
        return textField
    }()
    private lazy var passwordForRegistrationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.keyboardType = .numbersAndPunctuation
        textField.backgroundColor = .white
        textField.textColor = ColorsManager.zbzbTextColor
        textField.layer.cornerRadius = 4
        textField.becomeFirstResponder()
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        
        return textField
    }()
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Подтвердите пароль"
        textField.keyboardType = .numbersAndPunctuation
        textField.backgroundColor = .white
        textField.textColor = ColorsManager.zbzbTextColor
        textField.layer.cornerRadius = 4
        textField.becomeFirstResponder()
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        
        return textField
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ColorsManager.zbzbTextColor
        button.setTitle("Вход", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    private lazy var rememberLabel: UILabel = {
        let label = UILabel()
        label.text = "Забыли пароль?"
        label.textColor = ColorsManager.zbzbTextColor
        label.font = UIFont.italicSystemFont(ofSize: 16)
        
        return label
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ColorsManager.zbzbTextColor
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 8
        button.isHidden = true
        
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorsManager.zbzbBackgroundColor
        addSubview(logoImageView)
        addSubview(registrationSegmentedControl)
        addSubview(emailPasswordStack)
        addSubview(registrationStack)
        addSubview(confirmButton)
        addSubview(rememberLabel)
        addSubview(registrationButton)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        
        registrationStack.arrangedSubviews.forEach( { subview in
            if let subview = subview as? UITextField {
                subview.addTarget(self, action: #selector(pressReturn), for: .primaryActionTriggered)
            }
        })
        emailPasswordStack.arrangedSubviews.forEach( { subview in
            if let subview = subview as? UITextField {
                subview.addTarget(self, action: #selector(pressReturn), for: .primaryActionTriggered)
            }
        })
        
        registrationSegmentedControl.addTarget(self, action: #selector(chooseSegmentedControl), for: .valueChanged)
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
        self.registrationStack.snp.updateConstraints { make in
            make.top.equalTo(registrationSegmentedControl.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        self.confirmButton.snp.updateConstraints { make in
            make.top.equalTo(emailPasswordStack.snp.bottom).offset(20)
            make.centerX.equalTo(emailPasswordStack.snp.centerX)
            make.width.equalTo(160)
        }
        self.rememberLabel.snp.updateConstraints { make in
            make.top.equalTo(confirmButton.snp.bottom).offset(16)
            make.centerX.equalTo(emailPasswordStack.snp.centerX)
        }
        self.registrationButton.snp.updateConstraints { make in
            make.top.equalTo(registrationStack.snp.bottom).offset(20)
            make.centerX.equalTo(registrationStack.snp.centerX)
            make.width.equalTo(160)
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func pressReturn() {
        self.endEditing(true)
    }
    
   @objc private func chooseSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            emailPasswordStack.isHidden = false
            confirmButton.isHidden = false
            rememberLabel.isHidden = false
            registrationStack.isHidden = true
            registrationButton.isHidden = true
        case 1:
            emailPasswordStack.isHidden = true
            confirmButton.isHidden = true
            rememberLabel.isHidden = true
            registrationStack.isHidden = false
            registrationButton.isHidden = false
            
        default:
            registrationStack.isHidden = true
        }
    }
}
