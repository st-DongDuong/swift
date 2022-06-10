//
//  HistoryVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/16/22.
//

import UIKit
class OrderHistory: UIViewController {
    
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.tintColor = .red
        control.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        self.navigationController?.isNavigationBarHidden = true
        viewHeader.layer.cornerRadius = 10
        viewHeader.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner ]
        
    }
    
    func configTable() {
        let cell = UINib(nibName: "CustomOrderHistory", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CustomOrderHistory")
        tableView.dataSource = self
        tableView .delegate = self
        tableView.refreshControl = refreshControl
    }
    
    @objc func refreshData(){
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }
}

extension OrderHistory :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        OrderHistories.orderHistories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomOrderHistory") as? CustomOrderHistory else {
            return UITableViewCell()
        }
        
        cell.updateData(
            image: OrderHistories.orderHistories[indexPath.row].restaurant.photos.first ?? "",
            name: OrderHistories.orderHistories[indexPath.row].restaurant.name ,
            address: OrderHistories.orderHistories[indexPath.row].restaurant.address.address )
        cell.delegate = self
        return cell
        
    }
}

extension OrderHistory : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
        
    }
}

extension OrderHistory: CustomOrderHistoryDelegate{
    func check(button: CustomOrderHistory, action: CustomOrderHistory.Action) {
        
        let order  = OrderHistoryDetail()
        guard let index = tableView.indexPath(for:button) else {return}
            order.nameRes = OrderHistories.orderHistories[index.row].restaurant.name
        order.data = OrderHistories.orderHistories[index.row].orderItems
            navigationController?.pushViewController(order, animated: true)
    }
}

