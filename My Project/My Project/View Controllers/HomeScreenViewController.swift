//
//  HomeScreenViewController.swift
//  My Project
//
//  Created by  Maria Khamitsevich on 20.04.22.
//

import UIKit

protocol SetBackgroundColor: AnyObject {
    func setBackgroundColor(red: Float, green: Float, blue: Float, alpha: Double)
}

class HomeScreenViewController: UIViewController, SetBackgroundColor {
    
    var redShadeOfBackground: Float = 255
    var greenShadeOfBackground: Float = 190
    var blueShadeOfBackGround: Float = 189
    

    @IBOutlet var homeScreenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreenLabel.text = "Wellcome to ZooBazaar!"
        view.backgroundColor = UIColor(red: CGFloat(redShadeOfBackground / 255), green: CGFloat(greenShadeOfBackground / 255), blue: CGFloat(blueShadeOfBackGround / 255), alpha: 1)
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMenu(_ sender: UIButton) {
        let storybord = UIStoryboard(name: "Main", bundle: .main)
        let controller = storybord.instantiateViewController(withIdentifier: "ContactsViewController")
        if let controller = controller as? ContactsViewController {
        controller.backgroundDelegate = self
            controller.view.backgroundColor = view.backgroundColor
            controller.redValue = redShadeOfBackground
            controller.greenValue = greenShadeOfBackground
            controller.blueValue = blueShadeOfBackGround

        
        self.present(controller, animated: true)
        }
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        let storybord = UIStoryboard(name: "Main", bundle: .main)
//        let controller = storybord.instantiateViewController(withIdentifier: "MainTabBar")
//        if let controller = controller as? UITabBarController {
//            controller.view.backgroundColor = view.backgroundColor
//        }
        
    func setBackgroundColor(red: Float, green: Float, blue: Float, alpha: Double) {
        let backgroundColor = UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: alpha)
        let tabBarViewControllers = self.tabBarController?.viewControllers
        tabBarViewControllers?.forEach({ navigationController in
            if let navigationController = navigationController as? UINavigationController {
                navigationController.viewControllers.forEach({$0.view.backgroundColor = backgroundColor})
            }
        })
        self.redShadeOfBackground = red
        self.greenShadeOfBackground = green
        self.blueShadeOfBackGround = blue
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
