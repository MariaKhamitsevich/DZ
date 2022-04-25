//
//  ProfileViewController.swift
//  My Project
//
//  Created by  Maria Khamitsevich on 20.04.22.
//

import UIKit

protocol ChangeLabelTitle: AnyObject {
    func changeTitle(title: String)
}

class ProfileViewController: UIViewController {

    @IBOutlet var profileLogInButton: UIButton!
    @IBOutlet var wellcomeLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 190/255, blue: 189/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    // MARK: Pushing on LogIn Screen (LogInViewControllers)
    @IBAction func pressProfileLogInButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "LogInViewController")
        if let controller = controller as? LogInViewController {
        controller.loginDelegate = self
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

// Extension for make possible use delegate from LogInViewController
extension ProfileViewController: ChangeLabelTitle {
    
    func changeTitle(title: String) {

        wellcomeLabel.text = "Wellcome, \(title)!"
}
}
