//
//  File.swift
//  ZooBazaar
//
//  Created by  Maria Khamitsevich on 27.04.22.
//

import Foundation
import UIKit

class Test {
    let homeScreenNavigationController = UINavigationController(rootViewController: HomeScreenViewController())
    
    let favoritesScreenNavigationController = UINavigationController(rootViewController: FavoritesViewController())
    
    let tabBarController = UITabBarController()
    
    func setuptabBar() {
        tabBarController.setViewControllers([homeScreenNavigationController, favoritesScreenNavigationController], animated: false)
        
    }
}
