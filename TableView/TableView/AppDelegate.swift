//
//  AppDelegate.swift
//  TableView
//
//  Created by Dong Duong V. on 4/30/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let home = HomeViewController()
        let navi = UINavigationController(rootViewController: home)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
        

    }

    // MARK: UISceneSession Lifecycle

   


}

