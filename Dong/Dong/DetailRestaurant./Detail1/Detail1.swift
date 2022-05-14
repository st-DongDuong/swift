//
//  Detail1.swift
//  Dong
//
//  Created by Dong Duong V. on 5/11/22.
//

import UIKit

class Detail1: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLael: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 20
    }
    func updateCell1(image: String, name: String, address: String){
        imageView.downloaded(from: image)
        nameLael.text = name
        addressLabel.text = address
        
    }
}
