//
//  Ordering.swift
//  Dong
//
//  Created by Dong Duong V. on 5/12/22.
//

import UIKit

protocol OrderingDelegate: AnyObject {
    func cell(_ cell: OrderingVC,_ action: OrderingVC.Action)
}

class OrderingVC: UIViewController {
    
    enum Action {
//        case total(number: Int)
//        case price(add : Int)
        case save(menuItem: Menu, amount: Int, notes: String)
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
    
    
    var menu: Menu?
   // var restaurant: Restaurant?
    
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
        
        
    }
    
    @IBAction func pop(_ sender: Any) {
//        var totaly = ((menu?.price ?? 0) * number ) ?? 0
//        delegate?.cell(self, .total(number: number))
//        print(number)
//        delegate?.cell(self, .price(add: totaly))
//        note = noteToStore.text ?? ""
//        descri = descrip.text ?? ""
//       
//        saveOrder()
        dismiss(animated: true, completion: nil)
    }
    
    private func updateView() {
        imageTest.downloaded(from: menu?.imageUrl ?? "")
        nameLabel.text = menu?.name
        priceLabel.text = "\(menu?.price)"
        descrip.text = menu?.description
    }
    
    @IBAction func minusOrder(_ sender: Any) {
        if number > 0 {
            number -= 1
            totalLabel.text = "check out: \((menu?.price ?? 0) * number ) $" ?? ""
            numberLabel.text = "\(number)"
        }
    }
    
    @IBAction func plusOrder(_ sender: Any) {
        number += 1
        totalLabel.text = "check out: \((menu?.price ?? 0) * number ) $" ?? ""
        numberLabel.text = "\(number)"
    }
    
    func saveOrder () {  // tạo hàm để lưu lại những biến đã chọn
        let item = OrderItem(MenuItem: menu!, amout: number, note: note)
        if let index = ItemOrdering.cart.firstIndex(
            where: {$0.MenuItem.id == item.MenuItem.id }) {
            // so sánh id khi chọn == vs id đã chọn first thì thêm vô                
            ItemOrdering.cart[index] = item
        }else {
            ItemOrdering.cart.append(item)
        }
        
        
    }
    
    @IBAction func addButton(_ sender: Any) { // CKECKOUT
               
        var totaly = ((menu?.price ?? 0) * number ) ?? 0
        print(menu?.name)
     //  delegate?.cell(self, .total(number: number))
        print(number)
//        delegate?.cell(self, .price(add: totaly))
        note = noteToStore.text ?? ""
        descri = descrip.text ?? ""
       
       saveOrder()
        
        delegate?.cell(self, .save(menuItem: menu!, amount: number, notes: note))
        dismiss(animated: true, completion: nil)
        
    
        totalLabel.text = "\(totaly)"
        
//        delegate?.cell(self, .total(number: number))
//        print(number)
//        delegate?.cell(self, .price(add: totaly))
//
    
    }
}
struct Order{
//    var nameStore: String
//    var id :Int
//    var orderDate: String
//    var address: String
//    var imgStore: String
    var restaurant:Restaurant
    var paymentDate: Date
    var orederItems: [OrderItem]
}

struct OrderItem {
    var MenuItem: Menu
//    var restaurant: Int
    var amout: Int
    var note: String
   // var descrip: String
}
