//
//  Ordering.swift
//  Dong
//
//  Created by Dong Duong V. on 5/12/22.
//

import UIKit

protocol OrderingDelegate: AnyObject {
    func cell(_ cell: OrderingViewController,_ action: OrderingViewController.Action)
    
 }

class OrderingViewController: UIViewController {
    
    enum Action {
        case save(menuItem: Menu, amount: Int, notes: String, price: Int)
    
    }

    weak var delegate:OrderingDelegate?
    
    @IBOutlet weak var descrip: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var addview: UIButton!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var imageTest: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var noteToStore: UITextField!
    @IBOutlet weak var viewAdd: UIView!
    
    var menu: Menu?
    var number:Int = 0
    var total: Int = 0
    var note: String = ""
    var descri: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        headerView.layer.cornerRadius = 10
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        footerView.layer.cornerRadius = 15
        footerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner ]
        addview.layer.cornerRadius = 15
        imageTest.layer.cornerRadius = 8
        headerView.layer.cornerRadius = 16
        viewAdd.layer.cornerRadius = 10
        
    }
        
    @IBAction func pop(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func updateView() {
        guard let menu = menu else {
            return
        }
        
        imageTest.downloaded(from: menu.imageUrl)
        nameLabel.text = menu.name
        priceLabel.text = "\(menu.price)" + ",000đ"
        descrip.text = menu.description
    }
    
    @IBAction func minusOrder(_ sender: Any) {
        if number > 0 {
            number -= 1
            totalLabel.text = " Add : \((menu?.price ?? 0) * number ),000đ"
            numberLabel.text = "\(number)"
        }
    }
    
    @IBAction func plusOrder(_ sender: Any) {
        number += 1
        totalLabel.text = "Add : \((menu?.price ?? 0) * number ),000đ"
        numberLabel.text = "\(number)"
    }
    
    func saveOrder () {  // tạo hàm để lưu lại những biến đã chọn
        let item = OrderItem(MenuItem: menu!, amout: number, note: note)
        if let index = ItemOrdering.cart.firstIndex(
            where: {$0.MenuItem.id == item.MenuItem.id }) {
            // so sánh id khi chọn == vs id đã chọn first thì thêm vô
            ItemOrdering.cart[index] = item
            
        } else {
            
            ItemOrdering.cart.append(item)
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        let totalprice = ((menu?.price ?? 0) * number ) 
        note = noteToStore.text ?? ""
        descri = descrip.text ?? ""
        delegate?.cell(self, .save(menuItem: menu!, amount: number, notes: note, price: totalprice ))
        dismiss(animated: true, completion: nil)
        saveOrder()
        totalLabel.text = "\(totalprice),000đ"
    }
}

