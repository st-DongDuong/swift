//
//  CustomViewOrdering.swift
//  Dong
//
//  Created by Dong Duong V. on 5/19/22.
//

import UIKit

class CustomViewOrdering: UITableViewCell {

    @IBOutlet weak var priceHis: UILabel!
    @IBOutlet weak var qualityHis: UILabel!
    @IBOutlet weak var noteHis: UILabel!
    @IBOutlet weak var nameHis: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCustom(name: String, note: String , quality: Int, price: Int){
        nameHis.text = name
        noteHis.text = note
        qualityHis.text = "\(quality)"
        priceHis.text = "\(price)"
    }
    
}
