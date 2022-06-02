//
//  OrderingDetailVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/19/22.
//

import UIKit

class OrderHistoryDetail: UIViewController {
    var  data :[ OrderItem] = []
    var nameRes: String = ""
    
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerOD: UIView!

    @IBOutlet weak var totalOD: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var footerOD: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    
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
        
        priceLabel.layer.cornerRadius  = 10
        priceLabel.layer.cornerRadius  = 10

        headerOD.layer.cornerRadius = 10
        headerOD.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner ]
        
        totalLabel.layer.cornerRadius = 10
        totalLabel.clipsToBounds  = true
        
        footerOD.layer.cornerRadius = 10
        footerOD.clipsToBounds  = true
        footerOD.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        configTable()
        updateLabel()
        timeLable.text =  "\(OrderHistories.orderHistories.first!.paymentDate)"
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    func configTable() {
        let cell = UINib(nibName: "CustomOrderHistoryDetail", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CustomOrderHistoryDetail")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func updateLabel() {
        var total = 0
        data.forEach { item in
            nameLabel.text = nameRes
            let price = item.MenuItem.price
            let amount = item.amout
            total += price * amount
            priceLabel.text  = "Total: \(total) $"
            
        }
    }
}

extension OrderHistoryDetail :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomOrderHistoryDetail") as? CustomOrderHistoryDetail else {
            
            return UITableViewCell()
        }
        
        cell.updateCustom(name: data[indexPath.row].MenuItem.name ,
                          note: data[indexPath.row].note,
                          quality: data[indexPath.row].amout,
                          price: data[indexPath.row].MenuItem.price)
        return cell
    }
}

extension OrderHistoryDetail: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
}
