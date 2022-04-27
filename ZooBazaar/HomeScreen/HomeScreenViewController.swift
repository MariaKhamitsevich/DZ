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
        view.backgroundColor = .green
        // Do any additional setup after loading the view.
    }
    
   
    

}
