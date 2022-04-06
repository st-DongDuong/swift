//
//  AppDelegate.swift
//  Bai3
//
//  Created by Dong Duong V. on 05/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            window = UIWindow(frame: UIScreen.main.bounds)
            let custom = Bai3ViewController()
            window?.rootViewController = custom
            window?.backgroundColor = .lightGray
            window?.makeKeyAndVisible()

            return true
        }
    }
