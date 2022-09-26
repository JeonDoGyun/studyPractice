//
//  SceneDelegate.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/09/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let tabBarController = UITabBarController()
        let homeVC = HomeViewController()
        let closetVC = ClosetViewController()
        let styleVC = StyleViewController()
        
        tabBarController.viewControllers = [homeVC, closetVC, styleVC]
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        closetVC.tabBarItem = UITabBarItem(title: "Closet", image: UIImage(systemName: "folder.fill"), tag: 1)
        styleVC.tabBarItem = UITabBarItem(title: "Style", image: UIImage(systemName: "star.fill"), tag: 2)
        
        window?.makeKeyAndVisible()
//        window?.rootViewController = MainViewController()
        window?.rootViewController = LoginViewController()
        window?.backgroundColor = .systemBackground
    }


}

