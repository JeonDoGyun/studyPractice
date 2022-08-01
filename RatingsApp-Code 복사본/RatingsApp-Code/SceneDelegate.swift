//
//  SceneDelegate.swift
//  RatingsApp-Code
//
//  Created by 전도균 on 2022/08/01.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let homeVC = ViewController() // homeVC랑 밑에 있는 rootView는 다른 것. homeVC != navVC
        let navVC = UINavigationController(rootViewController: homeVC)
        homeVC.navigationItem.title = "Players"
        
        let gestureVC = GestureViewController()
        
        navVC.tabBarItem = UITabBarItem(title: "Player",
                                        image: UIImage(systemName: "crown"),
                                        tag: 0)
        gestureVC.tabBarItem = UITabBarItem(title: "Gesture",
                                            image: UIImage(systemName: "hand.draw"),
                                            tag: 1)
        // 이미지 이름 복사 : command shift c
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navVC, gestureVC]
        
        
        window?.rootViewController = tabBarController // root를 tabBarController로 지정
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
    }
    
    
    
    
}


