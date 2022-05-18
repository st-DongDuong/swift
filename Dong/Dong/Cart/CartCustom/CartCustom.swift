//
//  CartCustom.swift
//  Dong
//
//  Created by Dong Duong V. on 5/12/22.
//

import UIKit
protocol CartCustomDelegate: AnyObject {
    func cell(_ cell: CartCustom,_ action: CartCustom.Action)
}
class CartCustom: UITableViewCell {
   
    enum Action {
        case amount(number: Int)

    }
    
    var number = 0
    
    weak var delegate : CartCustomDelegate?
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        totalView.layer.cornerRadius = 10
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCart(name:String, note:String, price:Int, number:Int){
        nameLabel.text = name
        noteLabel.text = note
        priceLabel.text = "\(price)"
        self.number = number
        numberLabel.text = "\(number)"
    }
    
    @IBAction func plusButton(_ sender: Any) {
        
       number += 1
        numberLabel.text = "\(number)"
        delegate?.cell(self, .amount(number: number))
    
    }
    @IBAction func minusButton(_ sender: Any) {
        if number > 0 {
        number -= 1
        numberLabel.text = "\(number)"
        delegate?.cell(self, .amount(number: number))

        }
        
    }
}
