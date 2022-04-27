//
//  HomeScreenViewController.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 26.04.22.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    override func loadView() {
        view = HomeScreenView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = view as? HomeScreenView {
           view.settingsButton.addTarget(self, action: #selector(runToSettings), for: .touchUpInside)
        }
        
    }
    
    
    @objc func runToSettings(_ sender: UIButton) {
      present(SettingsViewController(), animated: true)
    }

}
