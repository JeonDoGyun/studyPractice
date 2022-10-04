//
//  SceneDelegate.swift
//  FootPrints
//
//  Created by 전도균 on 2022/10/04.
//



import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let tabBarController = TabBarController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
        window?.backgroundColor = .systemBackground
        
        
        
    }


}

