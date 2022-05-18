//
//  CustomTableView.swift
//  Dong
//
//  Created by Dong Duong V. on 5/5/22.
//

import UIKit

class CustomTableView: UITableViewCell {
   // var menuExplore : [Restaurant] = []
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageTable: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        totalView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   }
    func updateTabel(image:UIImage, name:String, address:String){
        imageTable.image = image
            nameLabel.text = name
        addressLabel.text = address
    
    }
}
