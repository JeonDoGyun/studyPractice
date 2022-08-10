//
//  AppDelegate.swift
//  Autolayout_practice
//
//  Created by 전도균 on 2022/08/08.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds) // 휴대폰 사이즈 프레임으로 만들겠다
        window?.rootViewController = ViewController()
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
        return true
    }


}

// scenedelegate : split view 지원하게 되면서 새로 만들어짐
