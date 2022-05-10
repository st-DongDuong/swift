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
        let home = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: home)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        
            
        let list = ListVC()
        let listNavi = UINavigationController(rootViewController: list)
        list.tabBarItem = UITabBarItem(title: "List", image: UIImage(named: "list")?.withRenderingMode(.alwaysOriginal), tag: 1)
        
        
        let user = UserVC()
        let userNavi = UINavigationController(rootViewController: user)
        user.tabBarItem = UITabBarItem(title: "User", image: UIImage(named: "user")?.withRenderingMode(.alwaysOriginal), tag: 2)
            
           
        let viewContro = [homeNavi,listNavi,userNavi]
//            let tagBarController = UITabBarController()
        setViewControllers(viewContro, animated: true)
        
    }
    func setColor(){
        tabBar.tintColor = .red
    }
}
