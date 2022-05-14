//
//  MainTabBar.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 14.05.22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [UINavigationController(rootViewController: HomeScreenViewController()),
                                UINavigationController(rootViewController: CartViewController()),
                                UINavigationController(rootViewController: MapsViewController()),
                                UINavigationController(rootViewController: ProfileViewController())]
        
        self.tabBar.barTintColor = ColorsManager.zbzbBackgroundColor
        self.tabBar.tintColor = ColorsManager.zbzbTextColor
        self.tabBar.unselectedItemTintColor = ColorsManager.unselectedColor
        self.tabBar.items![0].image = UIImage(systemName: "house.fill")
        self.tabBar.items![1].image = UIImage(systemName: "cart.fill")
        self.tabBar.items![2].image = UIImage(systemName: "map.fill")
        self.tabBar.items![3].image = UIImage(systemName: "person.fill")
        
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
