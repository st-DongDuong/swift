//
//  HistoryVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/16/22.
//

import UIKit

class OrderHistory: UIViewController {
    
    var orderDetail = OrderHistories.orderHistories
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
      
    }

    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func backbu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    func configTable() {
        let cell = UINib(nibName: "CustomOrderHistory", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CustomOrderHistory")
       
        tableView.dataSource = self
        tableView .delegate = self
    }
}

extension OrderHistory :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        orderDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomOrderHistory") as? CustomOrderHistory else {
            return UITableViewCell()
        }
    
        cell.updateHis(image: orderDetail.first?.restaurant.photos.first ?? ""  , name: orderDetail.first?.restaurant.name ?? "" ,
                       address: orderDetail.first?.restaurant.address.address ?? "")
        
        return cell
    }
}

extension OrderHistory : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var order  = OrderHistoryDetail()
    //    order.orderDetail  = HistoryRestaurantData.orderHistories
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

