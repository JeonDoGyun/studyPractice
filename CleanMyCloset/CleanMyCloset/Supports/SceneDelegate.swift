//
//  SceneDelegate.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/09/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let tabBarController = UITabBarController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = TabBarController()
//        window?.rootViewController = LoginViewController()
        window?.backgroundColor = .systemBackground
    }


}

