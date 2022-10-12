//
//  SceneDelegate.swift
//  Coordinator-Exam
//
//  Created by 전도균 on 2022/10/12.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationCotroller = UINavigationController()
        window?.rootViewController = navigationCotroller
        let coordinator = AppCoordinator(navigationController: navigationCotroller)
        coordinator.start()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

