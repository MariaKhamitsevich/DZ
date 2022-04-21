//
//  HomeScreenViewController.swift
//  My Project
//
//  Created by  Maria Khamitsevich on 20.04.22.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet var homeScreenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreenLabel.text = "Wellcome to ZooBazaar!"
        view.backgroundColor = UIColor(red: 255/255, green: 190/255, blue: 189/255, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMenu(_ sender: UIButton) {
        let storybord = UIStoryboard(name: "Main", bundle: .main)
        let controller = storybord.instantiateViewController(withIdentifier: "ContactsViewController")
        self.present(controller, animated: true)
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
