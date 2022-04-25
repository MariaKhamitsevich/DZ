//
//  HomeScreenViewController.swift
//  My Project
//
//  Created by  Maria Khamitsevich on 20.04.22.
//

import UIKit

// MARK: Protocol for backgroundDelegate (in ContactsViewController)
protocol SetBackgroundColor: AnyObject {
    func setBackgroundColor(red: Float, green: Float, blue: Float, alpha: Double)
}


class HomeScreenViewController: UIViewController, SetBackgroundColor {
    
// properties with shades for bacgroundColor
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
    
    // Present of ContactsViewController
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
    
// MARK: Method from protocol SetBackgroundColor which will be bounded with delegate (ContactsViewController)
    func setBackgroundColor(red: Float, green: Float, blue: Float, alpha: Double) {
        let backgroundColor = UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: alpha)
        let tabBarViewControllers = self.tabBarController?.viewControllers
        tabBarViewControllers?.forEach({ navigationController in
            if let navigationController = navigationController as? UINavigationController {
                for viewController in navigationController.viewControllers {
                    if viewController is HomeScreenViewController
                        || viewController is FavoritesViewController
                        || viewController is ProfileViewController {
                        viewController.view.backgroundColor = backgroundColor
                    }
                }
////                 background for all screens
//                navigationController.viewControllers.forEach({$0.view.backgroundColor = backgroundColor})
            }
        })
        self.redShadeOfBackground = red
        self.greenShadeOfBackground = green
        self.blueShadeOfBackGround = blue
    }
   

}
