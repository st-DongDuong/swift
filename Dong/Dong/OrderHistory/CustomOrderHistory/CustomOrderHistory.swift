//
//  CustomHistoryVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/19/22.
//

import UIKit
protocol CustomOrderHistoryDelegate:AnyObject{
    func check(button: CustomOrderHistory, action: CustomOrderHistory.Action)
}

class CustomOrderHistory: UITableViewCell {
    
    @IBOutlet weak var addressHis: UILabel!
    @IBOutlet weak var nameHis: UILabel!
    @IBOutlet weak var imageGps: UIImageView!
    @IBOutlet weak var imageHis: UIImageView!
    @IBOutlet weak var outSideView: UIView!
    
    @IBOutlet weak var checkButton: UIButton!
    enum Action{
        case check
    }
    
    weak var delegate:CustomOrderHistoryDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageGps.layer.cornerRadius = 8
//        imageGps.clipsToBounds = true

        outSideView.layer.cornerRadius = 10
//        outSideView.clipsToBounds = true
        checkButton.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func checkButton(_ sender: Any) {
        delegate?.check(button: self, action: .check)
    
    }
    
    func updateData(image: String ,name: String, address:String) {
        imageHis.downloaded(from: image)
        nameHis.text = name
        addressHis.text = address
    }
}
