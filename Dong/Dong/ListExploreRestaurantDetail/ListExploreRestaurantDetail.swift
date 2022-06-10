//
//  SeeAllVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/25/22.
//

import UIKit
class ListExploreRestaurantDetail: UIViewController{
    
    var listRestaurant: [Restaurant] = []
    
    @IBOutlet weak var headerList: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerList.layer.cornerRadius = 15
        headerList.clipsToBounds  = true
        headerList.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        config()
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func config() {
        let cell  = UINib(nibName: "CustomTableView", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CustomTableView")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ListExploreRestaurantDetail : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listRestaurant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableView", for: indexPath) as? CustomTableView else
        {
            return UITableViewCell()
        }
        
        cell.updateTabel(image: listRestaurant[indexPath.row].photos.first ?? "" ,
                         name: listRestaurant[indexPath.row].name,
                         address: listRestaurant[indexPath.row].address.address)
        cell.delegate = self
        return cell
        
    }
}

extension ListExploreRestaurantDetail :UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
        
    }
}

extension ListExploreRestaurantDetail: CustomTableViewDelegate{
    func cell(cell: CustomTableView, action: CustomTableView.Action) {
        switch action{
        case .datas:
            guard let index = tableView.indexPath(for: cell) else {return}
            let vc = DetailRestaurant()
            vc.restaurant = listRestaurant[index.row]
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.navigationBar.isHidden = true
            tabBarController?.tabBar.isHidden = true
        }
    }
}
