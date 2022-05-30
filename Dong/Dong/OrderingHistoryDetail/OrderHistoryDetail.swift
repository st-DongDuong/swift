//
//  OrderingDetailVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/19/22.
//

import UIKit

class OrderHistoryDetail: UIViewController {
   var  data = OrderHistories.orderHistories
    
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerOD: UIView!
    
    @IBOutlet weak var totalOD: UIButton!
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var footerOD: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationController?.isNavigationBarHidden = true
        priceLabel.layer.cornerRadius  = 10
        headerOD.layer.cornerRadius = 10
        headerOD.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner ]
        priceLabel.layer.cornerRadius  = 10
       
        nameLabel.text = data.first?.restaurant.name
        configTable()
        
        updateLabel()
        timeLable.text = "\(data.first!.paymentDate)"
    }
    
    func configTable(){
        let cell = UINib(nibName: "CustomViewOrdering", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CustomViewOrdering")
        
       
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func updateLabel() {
        var price = 0
        var total = 0
        data.forEach { item in
            item.orderItems.forEach { totalPrice in
                let price = totalPrice.MenuItem.price
                let amount = totalPrice.amout
                 total +=  price * amount
                priceLabel.text  = "Total: \(total) $"

            }
        
        }
    }
   
}
extension OrderHistoryDetail :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        OrderHistories.orderHistories.first?.orderItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomViewOrdering") as? CustomViewOrdering else {
            return UITableViewCell()
        }
        
        cell.updateCustom(name: data.first?.orderItems[indexPath.row].MenuItem.name ?? "",
                          note: data.first?.orderItems[indexPath.row].note ?? "",
                          quality: data.first?.orderItems[indexPath.row].amout ?? 0 ,
                          price: data.first?.orderItems[indexPath.row].MenuItem.price ?? 0)
        return cell
    }
    
}
extension OrderHistoryDetail: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
}
