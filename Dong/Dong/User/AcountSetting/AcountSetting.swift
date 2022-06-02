//
//  Cell2.swift
//  Dong
//
//  Created by Dong Duong V. on 5/7/22.
//

import UIKit

class AcountSetting: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var totalView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }    
}
