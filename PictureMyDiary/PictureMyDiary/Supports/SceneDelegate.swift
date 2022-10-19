//
//  SceneDelegate.swift
//  PictureMyDiary
//
//  Created by Eunsu JEONG on 2022/10/08.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        //        let contentView = ContentView()
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            //            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
        
        
        
        let viewBackgrounColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        
        let navVC = UINavigationController(rootViewController: CalendarViewController())
        let writeNewDiaryVC = UINavigationController(rootViewController: NewDiaryViewController())
        let diariesVC = UINavigationController(rootViewController: DiaryListViewController())
        
        navVC.tabBarItem = UITabBarItem(title: "Calender",
                                        image: UIImage(systemName: "calendar"),
                                        tag: 0)
        
        writeNewDiaryVC.tabBarItem = UITabBarItem(title: "New Diary",
                                                  image: UIImage(systemName: "paintbrush.pointed"),
                                                  tag: 1)
        
        diariesVC.tabBarItem = UITabBarItem(title: "My Diary",
                                            image: UIImage(systemName: "magazine"),
                                            tag: 2)
        
        let tabBarController = UITabBarController()

        tabBarController.viewControllers = [navVC, writeNewDiaryVC, diariesVC]
        tabBarController.tabBar.barTintColor = viewBackgrounColor
        
        window?.rootViewController = tabBarController
        window?.backgroundColor = viewBackgrounColor
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

