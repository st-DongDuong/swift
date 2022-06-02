//
//  Cell3.swift
//  Dong
//
//  Created by Dong Duong V. on 5/7/22.
//

import UIKit

class More: UITableViewCell {
    @IBOutlet weak var totalView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        totalView.layer.cornerRadius = 15
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
