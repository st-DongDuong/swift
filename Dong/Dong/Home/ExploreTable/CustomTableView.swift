//
//  CustomTableView.swift
//  Dong
//
//  Created by Dong Duong V. on 5/5/22.
//

import UIKit
protocol CustomTableViewDelegate: AnyObject{
    func cell(_cell:CustomTableView, action: CustomTableView.Action)
}
class CustomTableView: UITableViewCell {
    
    enum Action{
        case data(Restaurant)
        
    }
   // var menuExplore : [Restaurant] = []
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageTable: UIImageView!
    
    weak var delegate: CustomTableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        totalView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   }
    func updateTabel(image:String, name:String, address:String){
        guard let url = URL(string: image) else { return }
        imageTable.downloaded(from: url)
            nameLabel.text = name
        addressLabel.text = address
        }
    
}
