//
//  TabBarController.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/09/04.
//

import UIKit

class TabBarController: UITabBarController {
    
    let mainVC = MainViewController()
    let myPageVC = MyPageViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarController()

    }
}

extension TabBarController {
    func setTabBarController() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = UIColor.clear
        appearance.backgroundColor = .white
        
        self.tabBar.standardAppearance = appearance
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = UIColor.systemBlue
        
        self.tabBar.layer.masksToBounds = false
        self.tabBar.layer.shadowColor = UIColor.gray.cgColor
        self.tabBar.layer.shadowOpacity = 0.3
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.tabBar.layer.shadowRadius = 6
        
        self.viewControllers = [mainVC, myPageVC]
        
        mainVC.tabBarItem = UITabBarItem(title: "냉장고", image: UIImage(systemName: "server.rack"), tag: 0)
        myPageVC.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person"), tag: 1)
    }
}
