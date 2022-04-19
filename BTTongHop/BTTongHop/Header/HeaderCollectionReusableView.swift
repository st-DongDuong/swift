//
//  HeaderCollectionReusableView.swift
//  BTTongHop
//
//  Created by Dong Duong V. on 18/04/2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {


    @IBOutlet weak var header: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        header.layer.cornerRadius = 10
    }
    
}
