//
//  SceneDelegate.swift
//  Domino
//
//  Created by 전도균 on 2022/09/06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let tabBarController = UITabBarController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let categoryVC = CategoryViewController()
        let wishListVC = WishListViewController()
        
        let categoryNavVC = UINavigationController(rootViewController: categoryVC)
        let wishListNavVC = UINavigationController(rootViewController: wishListVC)
        
        categoryVC.navigationItem.title = "Domino's"
        wishListVC.navigationItem.title = "Wish List"
        
        tabBarController.viewControllers = [categoryNavVC, wishListNavVC]
        categoryNavVC.tabBarItem = UITabBarItem(title: "Domino's", image: UIImage(named: "domino's"), tag: 0)
        wishListNavVC.tabBarItem = UITabBarItem(title: "Wish List", image: UIImage(named: "wishlist"), tag: 1)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
    }


}

