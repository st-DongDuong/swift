//
//  CustomCollectionBanner.swift
//  Dong
//
//  Created by Dong Duong V. on 5/4/22.
//

import UIKit

class CustomCollectionBanner: UICollectionViewCell {

    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var imagBanner: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        totalView.layer.cornerRadius = 28
        self.layer.masksToBounds = true
        imagBanner.layer.cornerRadius = 20

    }

    func updateBanner(image:String){
        guard let url = URL(string: image) else { return }
        imagBanner.downloaded(from: url)
    }

}
