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
        
        return cell
    
    }
}

extension OrderHistory : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let order  = OrderHistoryDetail()
        order.nameRes = OrderHistories.orderHistories[indexPath.row].restaurant.name
        order.data = OrderHistories.orderHistories[indexPath.row].orderItems
        navigationController?.pushViewController(order, animated: true)
    }
    
}

//}
//extension HistoryVC: DetailResDelegate {
//    func view(_ view: DetailRes, _ action: DetailRes.Action) {
//        //switch action {
//       // case .saveHistory(let restaurant):
////            HistoryRestaurantData.listRestaurant.append(restaurant)
//        }
//    }

