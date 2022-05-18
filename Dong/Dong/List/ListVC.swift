//
//  ListVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/4/22.
//

import UIKit

class ListVC: UIViewController {

    var list: Restaurant?
    
    @IBOutlet weak var tableList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButton(_ sender: Any) {
        print("alo")
        dismiss(animated: true, completion: nil)
    }
    func configTableList(){
        let cell = UINib(nibName: "ListBooking", bundle: nil)
        tableList.register(cell, forCellReuseIdentifier: "ListBooking")
        tableList.dataSource = self
    }
}
extension ListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListBooking") as? ListBooking else {

            return UITableViewCell()
        }
        return cell
    }
}
