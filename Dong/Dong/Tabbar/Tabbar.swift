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
        homeNavi.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "h1")?.withRenderingMode(.alwaysOriginal), tag: 0)
        
            
        let listVC = OrderHistory()
        let listNavi = UINavigationController(rootViewController: listVC)
        listVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "list")?.withRenderingMode(.alwaysOriginal), tag: 1)
        
        
        let user = UserViewController()
        let userNavi = UINavigationController(rootViewController: user)
        user.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "user")?.withRenderingMode(.alwaysOriginal), tag: 2)
            
           
        let viewContro = [homeNavi,listNavi,userNavi]
//            let tagBarController = UITabBarController()
        setViewControllers(viewContro, animated: true)
        
    }
    func setColor(){
        tabBar.tintColor = .red
        tabBar.layer.cornerRadius = 16
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner , .layerMinXMinYCorner  ]
    }
}
