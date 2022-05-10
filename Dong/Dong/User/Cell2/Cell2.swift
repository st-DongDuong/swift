//
//  Cell2.swift
//  Dong
//
//  Created by Dong Duong V. on 5/7/22.
//

import UIKit

class Cell2: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var totalView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
