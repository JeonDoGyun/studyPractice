//
//  SceneDelegate.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/08/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let tabBarController = UITabBarController()
    let mainVC = MainViewController()
    let myPageVC = MyPageViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        setTabBarController()
        
        let loginVC = LoginViewController()
        
        window?.rootViewController = loginVC // tabBarController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
    }

}

extension SceneDelegate {
    func setTabBarController() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = UIColor.clear
        appearance.backgroundColor = .white
        
        tabBarController.tabBar.standardAppearance = appearance
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.backgroundColor = UIColor.systemBlue
        
        tabBarController.tabBar.layer.masksToBounds = false
        tabBarController.tabBar.layer.shadowColor = UIColor.gray.cgColor
        tabBarController.tabBar.layer.shadowOpacity = 0.3
        tabBarController.tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBarController.tabBar.layer.shadowRadius = 6
        
        tabBarController.viewControllers = [mainVC, myPageVC]
        
        mainVC.tabBarItem = UITabBarItem(title: "냉장고", image: UIImage(systemName: "server.rack"), tag: 0)
        myPageVC.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person"), tag: 1)
    }
}
