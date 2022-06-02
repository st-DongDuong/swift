//
//  CustomHistoryVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/19/22.
//

import UIKit

class CustomOrderHistory: UITableViewCell {
    
    @IBOutlet weak var addressHis: UILabel!
    @IBOutlet weak var nameHis: UILabel!
    @IBOutlet weak var imageGps: UIImageView!
    @IBOutlet weak var imageHis: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateData(image: String ,name: String, address:String) {
        imageHis.downloaded(from: image)
        nameHis.text = name
        addressHis.text = address
    }
}
