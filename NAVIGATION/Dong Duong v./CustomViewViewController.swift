//
//  CustomViewViewController.swift
//  Dong Duong v.
//
//  Created by Dong Duong V. on 05/04/2022.
//

import UIKit

class CustomViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        navigationController?.navigationBar.backgroundColor = .cyan
        let image = UIImage(named: "anh.png")
        navigationController?.navigationBar.backgroundImage(for: .default)

        //add Button
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
        let bookMarkItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(book))

        navigationItem.rightBarButtonItems = [searchButton, bookMarkItem]

        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = backButton

    }
    @objc func search() {
            print("taped")
        }
    @objc func book() {
            print("setting")
        }
}
//    import UIKit
//
//    class CustomViewViewController : UIViewController {
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            navigationItem.title = "Detail"
//            // Do any additional setup after loading the view.
//            navigationController?.isNavigationBarHidden = true
//
//            let searchBar = UIBarButtonItem(title: "ABCD", style: .done, target: self, action: #selector(searchBar))
//            searchBar.tintColor = .red
//            navigationItem.leftBarButtonItem = searchBar
//
//
//            let abc = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//            abc.backgroundColor = .red
//            let barButtonItem = UIBarButtonItem(customView: abc)
//            navigationItem.leftBarButtonItem = barButtonItem
//        }
//
//        @objc
//        func searchBar() {
//            navigationController?.popViewController(animated: true)
//        }
//
//        @objc
//        func addBar() {
//            navigationController?.popViewController(animated: true)
//        }
//
//        @IBAction func backButton(_ sender: UIButton) {
//            navigationController?.popViewController(animated: true)
//        }
//    }
