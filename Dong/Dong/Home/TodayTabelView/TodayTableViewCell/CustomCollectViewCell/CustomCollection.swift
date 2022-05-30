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
        imageToday.layer.cornerRadius = 8
        imageToday.clipsToBounds = true
        imageToday.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        totalVieww.layer.cornerRadius = 16
        totalVieww.clipsToBounds = true
    }
    
    func updateToday(image: String, name:String, address:String){
        imageToday.downloaded(from: image)
        nameToday.text = name
        addressToday.text = address
    }
 
}
