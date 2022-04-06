//
//  UserView.swift
//  Bai3
//
//  Created by Dong Duong V. on 06/04/2022.
//

import UIKit

class UserView: UIView {
    
    var userName:UILabel?
    var userAvatar :UIImageView?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        // them avatar
        let frame = CGRect(x: 20, y: 100, width: 100, height: 100)
         let userAvatar = UIImageView(image:UIImage(named: "anh.png"))
        userAvatar.frame = frame
         userAvatar.contentMode = .scaleToFill
         addSubview(userAvatar)
    
            // thêm user
        userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userName?.text = "User name"
         userName?.textColor = .red
         userName?.backgroundColor = .white
         addSubview(userName!)
        
        // thêm button
        let button1 = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 50))
        button1.backgroundColor = .clear
        button1.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
            addSubview(button1)
    
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func buttonClick(){
        let unwrap = userName?.text
             print("\(unwrap!)")
         }
    }

    

