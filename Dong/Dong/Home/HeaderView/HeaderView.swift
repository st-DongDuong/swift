//
//  HeaderView.swift
//  Dong
//
//  Created by Dong Duong V. on 5/7/22.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
   // @IBOutlet weak var buttonLabel: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateHeader(name: String, detail: String ){
        titleLabel .text = name
        detailLabel.text = detail
    }
}
