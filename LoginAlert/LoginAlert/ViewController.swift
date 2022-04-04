//
//  ViewController.swift
//  LoginAlert
//
//  Created by Dong Duong V. on 04/04/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let alert:UIAlertController = UIAlertController(title: "Login", message: "vui lòng nhập thông tin", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField{(txtEmail) in
            txtEmail.placeholder = "📧 nhập email "
            
        }
        alert.addTextField{ (txtPass) in
            txtPass.placeholder = "🔑 nhập mật khẩu"
            txtPass.isSecureTextEntry = true
        }
        let btnLogin: UIAlertAction = UIAlertAction(title: "Đăng nhập", style: .destructive){ (btnLogin) in
            
        }
        let btnCancel:UIAlertAction = UIAlertAction(title: "Huỷ", style: .cancel){(btnCancel) in
            
        }
        alert.addAction(btnLogin)
        alert.addAction(btnCancel)
        present(alert,animated: true, completion: nil)
    }

}

