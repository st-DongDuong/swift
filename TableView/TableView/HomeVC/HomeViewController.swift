//
//  HomeViewController.swift
//  TableView
//
//  Created by Dong Duong V. on 4/30/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var list:[Name] = [Name(img: UIImage(named: "anh")!, name: "name1", detail: "seeName1"),Name(img: UIImage(named: "anh")!, name: "name2", detail: "seeName1"),
        Name(img: UIImage(named: "anh")!, name: "name3", detail: "seeName3"),
        Name(img: UIImage(named: "anh")!, name: "name4", detail: "seeName4"),
        Name(img: UIImage(named: "anh")!, name: "name5", detail: "seeName5"),
        Name(img: UIImage(named: "anh")!, name: "name6", detail: "seeName6")]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
     
        
    }
    
    func configTableView(){
        let celltable = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(celltable, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}
extension HomeViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.updateTable(img: list[indexPath.row].img, name: list[indexPath.row].name, detail: list[indexPath.row].detail)
        return cell
    }
}
extension HomeViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController()
        detail.imgDetail = UIImage(named: list[indexPath.row].img)!
        detail. = list[indexPath.row]
        navigationController?.pushViewController(detail, animated: true)
    }
}
