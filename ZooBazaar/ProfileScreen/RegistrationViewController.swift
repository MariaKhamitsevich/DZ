//
//  ProfileViewController.swift
//  ZooBazaar
//
//  Created by Maria Khamitsevich on 9.05.22.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    weak var dataDelegate: ProfileDataSettable?
    
    private var registrationView: RegistrationView {
        view as! RegistrationView
    }
    
    override func loadView() {
        view = RegistrationView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        registrationView.confirmButton.addTarget(self, action: #selector(runToProfile), for: .touchUpInside)
        registrationView.registrationButton.addTarget(self, action: #selector(runToProfile), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
  
    
   @objc private func runToProfile() {
       dataDelegate?.setName(name: RegistrationView().name)
       dataDelegate?.setEmail(email: RegistrationView().email)
       navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
}
