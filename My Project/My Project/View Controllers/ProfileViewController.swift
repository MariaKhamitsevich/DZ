//
//  ProfileViewController.swift
//  My Project
//
//  Created by  Maria Khamitsevich on 20.04.22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var profileLogInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func pressProfileLogInButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "LogInViewController")
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
