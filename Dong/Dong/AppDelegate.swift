//
//  AppDelegate.swift
//  Dong
//
//  Created by Dong Duong V. on 5/4/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       let tab = Tabbar()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tab
        window?.makeKeyAndVisible()
        return true
    }


}

