//
//  CartVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/12/22.
//

import UIKit
protocol CartVCDelegate: AnyObject{
    func cartdata(_ cart: CartVC, _ Action: CartVC.Action )
}

class CartVC: UIViewController {
    
    enum Action {
        case Order(number: Int)
        case totalAmount(totalOrder:Int)

    }
    weak var delegate: CartVCDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var checkOutlabel: UILabel!
    @IBOutlet weak var qualityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    
    var cartDetail: Restaurant?
    
//    var hisOrder:Restaurant?
//    var total: Restaurant?
    
    var totalAmout = 0
    var price: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        updateCart()
        
        if ItemOrdering.cart.isEmpty {
            footerView.isHidden = true
            tableView.reloadData()
        }else {
            footerView.isHidden = false
        }
        
    }

    func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        
        print(result)
        return result
    }
    
    func updateCart() {
        price = 0
        totalAmout = 0
        ItemOrdering.cart.forEach{ item in
            let amout = item.amout
            let pri = item.MenuItem.price ?? 0
            price += amout * pri
            totalAmout += item.amout // cộng dồn mỗi lần lấy vào total
        }
        priceLabel.text = "\(price) 000đ"
        qualityLabel.text = "\(totalAmout)" // bỏ ra ngoài for để lấy tổng thôi
    }

    @IBAction func checkOutButton(_ sender: Any) {
        
        priceLabel.text = " 0 "
        qualityLabel.text = " 0 "
        dismiss(animated: true, completion: nil)
        
        self.navigationController?.isNavigationBarHidden = true
              self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func backButton(_ sender: Any) {
        delegate?.cartdata(self, .Order(number: price))
        print("push delege from Cart  \(price)")
       delegate?.cartdata(self, .totalAmount(totalOrder: totalAmout))
        print("push delege from Cart \(totalAmout)" )
       
        dismiss(animated: true, completion: nil)
        }
    
    
        @IBAction func clearButton(_ sender: UIButton) {
            ItemOrdering.cart.removeAll()
            dismiss(animated: true, completion: nil)
    
            tableView.reloadData()
    }
    
    func configTable() {
        let cell = UINib(nibName: "CartCustom", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CartCustom")
        
        //tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CartVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ItemOrdering.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCustom") as? CartCustom else {
            return UITableViewCell()
        }
        cell.updateCart(name: ItemOrdering.cart[indexPath.row].MenuItem.name ?? "",
                        note: ItemOrdering.cart[indexPath.row].note ,
                        price: ItemOrdering.cart[indexPath.row].MenuItem.price ?? 0,
                        number: ItemOrdering.cart[indexPath.row].amout)
        
        cell.delegate = self
        return cell
    }
}

extension CartVC :CartCustomDelegate{
    func cell(_ cell: CartCustom, _ action: CartCustom.Action) {
        switch action {
        case .amount( let number):
            print(number)
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            ItemOrdering.cart[indexPath.row].amout = number
             updateCart()
            priceLabel.text  = "\(price).000đ"
            // qualityLabel.text = "\(totalAmout)"
        }
    }
    
}
