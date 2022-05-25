//
//  Detail2.swift
//  Dong
//
//  Created by Dong Duong V. on 5/11/22.
//

import UIKit
class CustomRecomendMenu: UICollectionViewCell {


    
        @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var viewOut: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 8
       // viewOut.layer.cornerRadius = 10
    }
    func updateDetail2(img: String, name:String, price:Int){
        imageView.downloaded(from: img)
        nameLabel.text = name
        priceLabel.text = "\(price)"
    }
}
