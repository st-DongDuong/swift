//
//  LoginViewController.swift
//  Dong Duong v.
//
//  Created by Dong Duong V. on 07/04/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func button_action(_ sender: Any) {
    if userName.text == "ABC" && password.text == "123" {
            navigationController?.pushViewController(CustomViewViewController(), animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Sai user passowrd", preferredStyle: .alert)
            let done = UIAlertAction(title: "done", style: .default) { action in
            }
            alert.addAction(done)
            present(alert, animated: true)
        }

}
}
