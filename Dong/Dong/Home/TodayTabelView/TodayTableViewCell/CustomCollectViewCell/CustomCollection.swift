//
//  CustomCollection.swift
//  Dong
//
//  Created by Dong Duong V. on 5/5/22.
//

import UIKit


class CustomCollection: UICollectionViewCell {

    @IBOutlet weak var totalVieww: UIView!
    @IBOutlet weak var addressToday: UILabel!
    @IBOutlet weak var nameToday: UILabel!
    @IBOutlet weak var imageToday: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        totalVieww.layer.cornerRadius = 10
        imageToday.layer.cornerRadius = 10
    }
    
    func updateToday(image: String, name:String, address:String){
        imageToday.downloaded(from: image)
        nameToday.text = name
        addressToday.text = address
    }
}
