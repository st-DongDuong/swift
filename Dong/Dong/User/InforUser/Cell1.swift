//
//  Cell1.swift
//  Dong
//
//  Created by Dong Duong V. on 5/10/22.
//

import UIKit

class InforUser: UITableViewCell {

    @IBOutlet weak var totalView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        totalView.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
