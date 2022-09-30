//
//  TabBarController.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/09/26.
//

import UIKit

class TabBarController: UITabBarController {
    
    let homeVC = HomeViewController()
    let closetVC = ClosetViewController()
    let styleVC = StyleViewController()
    let myPageVC = MyPageViewController()
    
    let appearance = UITabBarAppearance()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

}

extension TabBarController {
    private func setUI() {
        self.viewControllers = [homeVC, closetVC, styleVC, myPageVC]
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        closetVC.tabBarItem = UITabBarItem(title: "Closet", image: UIImage(systemName: "folder.fill"), tag: 1)
        styleVC.tabBarItem = UITabBarItem(title: "Style", image: UIImage(systemName: "star.fill"), tag: 2)
        myPageVC.tabBarItem = UITabBarItem(title: "myPage", image: UIImage(systemName: "person.fill"), tag: 3)
        
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = UIColor.clear
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
        
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        
        tabBar.tintColor = .gray
        
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 6
        
        
    }
}
