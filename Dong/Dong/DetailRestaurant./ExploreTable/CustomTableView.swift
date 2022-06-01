//
//  CustomTableView.swift
//  Dong
//
//  Created by Dong Duong V. on 5/5/22.
//

import UIKit
protocol CustomTableViewDelegate: AnyObject {
    func cell(cell:CustomTableView, action: CustomTableView.Action)
}

class CustomTableView: UITableViewCell {
    
    enum Action {
        
        case datas
        
    }
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageTable: UIImageView!
    
    weak var delegate: CustomTableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        totalView.layer.cornerRadius = 10
        imageTable.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   }
    @IBAction func detailButton(_ sender: Any) {
        delegate?.cell(cell: self,action: .datas)
    }
    
    func updateTabel(image:String, name:String, address:String){
        guard let url = URL(string: image) else { return }
        imageTable.downloaded(from: url)
            nameLabel.text = name
        addressLabel.text = address
        
        }
}
