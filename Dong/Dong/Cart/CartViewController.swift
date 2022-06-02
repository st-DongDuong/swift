//
//  CartVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/12/22.
//

import UIKit
protocol CartViewControllerDelegate: AnyObject{
    func cartdata(_ cart: CartViewController, _ Action: CartViewController.Action )
}

class CartViewController: UIViewController {
    
    enum Action {
        case totalAmount(totalOrder:Int, number: Int)
        case reload
    }
    
    weak var delegate: CartViewControllerDelegate?  
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var checkOutlabel: UILabel!
    @IBOutlet weak var qualityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var coverLable: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    
    var cartDetail: Restaurant?

    var totalAmout = 0
    var price: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        updateCart()
        
        if ItemOrdering.cart.isEmpty {
            footerView.isHidden = true
            tableView.reloadData()
        } else {
            footerView.isHidden = false
        }

        coverLable.layer.cornerRadius = 10
        footerView.layer.cornerRadius = 10
        footerView.clipsToBounds = true
        footerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner ]
        headerView.layer.cornerRadius  =  10
        headerView.clipsToBounds = true
    }

    func updateCart() {
        price = 0
        totalAmout = 0
        ItemOrdering.cart.forEach{ item in
            price += item.MenuItem.price * item.amout
            totalAmout += item.amout
            
        }
    
        priceLabel.text = "\(price),000đ"
        qualityLabel.text = "\(totalAmout) items " // bỏ ra ngoài for để lấy tổng thôi
    }
    
    @IBAction func checkOutButton(_ sender: Any) {
        
        ItemOrdering.cart.removeAll()
            tableView.reloadData()
            dismiss(animated: true, completion: nil)
        delegate?.cartdata(self, .totalAmount(totalOrder: totalAmout , number: price))
       delegate?.cartdata(self, .reload)
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        delegate?.cartdata(self, .totalAmount(totalOrder: totalAmout, number: price))
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        ItemOrdering.cart.removeAll()
        dismiss(animated: true, completion: nil)
        delegate?.cartdata(self, .reload)

    }
    
    func configTable() {
        let cell = UINib(nibName: "CartCustom", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CartCustom")
        
        tableView.dataSource = self
    }
}

extension CartViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ItemOrdering.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCustom") as? CartCustom else {
            return UITableViewCell()
        }
        cell.updateCart(name: ItemOrdering.cart[indexPath.row].MenuItem.name ,
                        note: ItemOrdering.cart[indexPath.row].note ,
                        price: ItemOrdering.cart[indexPath.row].MenuItem.price ,
                        number: ItemOrdering.cart[indexPath.row].amout)
        
        cell.delegate = self
        return cell
    }
}

extension CartViewController :CartCustomDelegate {
    func cell(_ cell: CartCustom, _ action: CartCustom.Action) {
        switch action {
        case .amount( let number):
            
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            ItemOrdering.cart[indexPath.row].amout = number
            updateCart()
        
        }
    }
    
}
