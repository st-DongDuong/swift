//
//  OrderingDetailVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/19/22.
//

import UIKit

class OrderHistoryDetail: UIViewController {
   
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerOD: UIView!
    
    @IBOutlet weak var totalOD: UIButton!
    @IBAction private func  backButton(_ sender: UIButton) {
    
    }
    
    @IBOutlet weak var footerOD: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func configTable(){
        let cell = UINib(nibName: "CustomViewOrdering", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CustomViewOrdering")
    
        tableView.dataSource = self
    }
}

extension OrderHistoryDetail :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  orderDetail.count
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomViewOrdering") as? CustomViewOrdering else {
            return UITableViewCell()
        }
//        cell.updateCustom(name: orderDetail.first?.restaurant.name, note: <#T##String#>, quality: <#T##Int#>, price: <#T##Int#>)
        return cell
    }
}
