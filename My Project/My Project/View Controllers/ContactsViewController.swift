//
//  ContactsViewController.swift
//  My Project
//
//  Created by  Maria Khamitsevich on 21.04.22.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet var telephoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        telephoneLabel.text = "Telephone:"
        emailLabel.text = "Email:"
        view.backgroundColor = UIColor(red: 255/255, green: 190/255, blue: 189/255, alpha: 1)
        // Do any additional setup after loading the view.
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
