//
//  Bai3ViewController.swift
//  Bai3
//
//  Created by Dong Duong V. on 05/04/2022.
//

import UIKit

class Bai3ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        let h1 = UserView(frame:CGRect(x: 0, y: 50, width: 100, height: 120))
        h1.userName?.text = "name1"
        view.addSubview(h1)
        let h2 = UserView(frame:CGRect(x: 140, y: 50, width: 100, height: 120))
        h2.userName?.text = "name2"
        view.addSubview(h2)
        let h3 = UserView(frame:CGRect(x: 270, y: 50, width: 100, height: 120))
        h3.userName?.text = "name3"
        view.addSubview(h3)
        let h4 = UserView(frame:CGRect(x: 0, y: 200, width: 100, height: 120))
        h4.userName?.text = "name4"
        view.addSubview(h4)
        let h5 = UserView(frame:CGRect(x: 140, y: 200, width: 100, height: 120))
        h5.userName?.text = "name5"
        view.addSubview(h5)
        let h6 = UserView(frame:CGRect(x: 270, y: 200, width: 100, height: 120))
        h6.userName?.text = "name6"
        view.addSubview(h6)
        
        let h7 = UserView(frame:CGRect(x: 0, y: 370, width: 100, height: 120))
        h7.userName?.text = "name7"
        view.addSubview(h7)
        let h8 = UserView(frame:CGRect(x: 140, y: 370, width: 100, height: 120))
        h8.userName?.text = "name8"
        view.addSubview(h8)
        let h9 = UserView(frame:CGRect(x: 270, y: 370,width: 100, height: 120))
        h9.userName?.text = "name9"
        view.addSubview(h9)
        
    }
}
