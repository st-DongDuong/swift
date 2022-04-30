//
//  BannerCollectionViewCell.swift
//  BTTongHop
//
//  Created by Dong Duong V. on 18/04/2022.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bannerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bannerIMG (img : UIImage) {
        bannerImage.image = img
       }
}
