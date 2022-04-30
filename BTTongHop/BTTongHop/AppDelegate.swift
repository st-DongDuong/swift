//
//  AppDelegate.swift
//  BTTongHop
//
//  Created by Dong Duong V. on 18/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {        
        let home = HomeViewController()
        let homNavi = UINavigationController(rootViewController: home)
        homNavi.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        
            
            let heart = HeartViewController()
            let heartNavi = UINavigationController(rootViewController: heart)
            heartNavi.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "Vector"), tag: 0)
            
            let viewContro = [homNavi,heartNavi]
            let tagBarController = UITabBarController()
        tagBarController.viewControllers = viewContro
        
        let navi = UINavigationController(rootViewController: tagBarController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        
        return true
    }
    }

