//
//  HeaderCollectionReusableView.swift
//  BTTongHop
//
//  Created by Dong Duong V. on 18/04/2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {


    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.layer.cornerRadius = 10
    }
    func updateTitle(_ title: String) {
            titleLabel.text = title
        }
}
