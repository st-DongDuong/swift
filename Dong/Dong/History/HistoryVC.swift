//
//  HistoryVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/16/22.
//

import UIKit

class HistoryVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func configTable() {
        let cell = UINib(nibName: "CustomTableView", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CustomTableView")
        tableView.dataSource = self
        tableView .delegate = self
    }
}

extension HistoryVC :UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        HistoryRestaurantData.orderHistories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableView") as? CustomTableView else {
            return UITableViewCell()
        }
        
        let res = HistoryRestaurantData.orderHistories[indexPath.item]
        cell.updateTabel(image: res.imgStore, name: res.nameStore, address: res.address)
        
        return cell
    }
}

extension HistoryVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var order  = OrderingDetailVC()
        order.orderDetail  = HistoryRestaurantData.orderHistories
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

