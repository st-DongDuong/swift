//
//  Detail2.swift
//  Dong
//
//  Created by Dong Duong V. on 5/11/22.
//

import UIKit
class CustomRecomendMenu: UICollectionViewCell {

    @IBOutlet weak var totalViewCustom: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

    }
    
    func updateDetail2(img: String, name: String, price: Int){
        imageView.downloaded(from: img)
        nameLabel.text = name
        priceLabel.text = "\(price)" + ",000đ"
    }
}
