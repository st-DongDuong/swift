//
//  AppDelegate.swift
//  Dong Duong v.
//
//  Created by Dong Duong V. on 05/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        //let cus = CustomViewViewController()
        let login = LoginViewController()

        let navi = UINavigationController(rootViewController:login )
        window?.rootViewController = navi
        window?.backgroundColor = .lightGray
        window?.makeKeyAndVisible()
        return true
    }
}

