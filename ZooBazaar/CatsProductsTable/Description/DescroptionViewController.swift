//
//  DescroptionViewController.swift
//  ZooBazaar
//
//  Created by Maria Khamitsevich on 18.05.22.
//

import UIKit

class DescroptionViewController: UIViewController {

    var descriprionVeiw: DescriprionView {
        view as! DescriprionView
    }
    
    
    override func loadView() {
        view = DescriprionView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        descriprionVeiw.exampleButton.addTarget(self, action: #selector(presentToController), for: .touchUpInside)
    }
    
    @objc func presentToController() {
        let controller = SomeViewController()
        present(controller, animated: true)
    }

}
