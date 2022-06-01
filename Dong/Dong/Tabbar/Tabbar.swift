//
//  Tabbar.swift
//  Dong
//
//  Created by Dong Duong V. on 5/4/22.
//



import Foundation
import UIKit
class Tabbar : UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTab()
        setColor()
     
    }
    
    func setTab(){
        let home   = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: home)
        homeNavi.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "home1")?.withRenderingMode(.alwaysOriginal))
            
        let listVC = OrderHistory()
        let listNavi = UINavigationController(rootViewController: listVC)
        listVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "list")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "list1")?.withRenderingMode(.alwaysOriginal))
        
        let userVC = UserViewController()
        userVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "user")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "user1")?.withRenderingMode(.alwaysOriginal))
           
        let viewContro = [homeNavi,listNavi,userVC]
        setViewControllers(viewContro, animated: true)
        
    }
    
    func setColor() {
        tabBar.layer.cornerRadius = 16
        tabBar.clipsToBounds  = true
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner  ]
    }
}
