//
//  SceneDelegate.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/08/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = StartViewController()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
    }

}
