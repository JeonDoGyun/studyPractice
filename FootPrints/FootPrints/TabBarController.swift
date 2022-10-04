//
//  TabBarController.swift
//  FootPrints
//
//  Created by 전도균 on 2022/10/04.
//

import UIKit

class TabBarController: UITabBarController {
    
    let homeVC = HomeViewController()
    let registerVC = RegisterViewController()
    let mapVC = MapViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [homeVC, registerVC, mapVC]
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        registerVC.tabBarItem = UITabBarItem(title: "Register", image: UIImage(systemName: "note.text.badge.plus"), tag: 1)
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map.fill"), tag: 2)
        
        setUI()
    }
}

extension TabBarController {
    private func setUI() {
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 6
        
    }
}
