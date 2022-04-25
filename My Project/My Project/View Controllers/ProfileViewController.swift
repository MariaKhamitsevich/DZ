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
    
    
    @IBAction func pressProfileLogInButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "LogInViewController")
        if let controller = controller as? LogInViewController {
        controller.loginDelegate = self
        }
        self.navigationController?.pushViewController(controller, animated: true)
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


extension ProfileViewController: ChangeLabelTitle {
    
    func changeTitle(title: String) {

        wellcomeLabel.text = "Wellcome, \(title)!"
}
}
