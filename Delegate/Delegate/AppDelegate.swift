//
//  AppDelegate.swift
//  Delegate
//
//  Created by Dong Duong V. on 08/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let listStudent = ListStudentViewController()
        let navi = UINavigationController(rootViewController: listStudent)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
    }
}
