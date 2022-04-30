//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Dong Duong V. on 4/30/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imageTableView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateTable(img: UIImage, name: String, detail: String){
        imageTableView.image = img
        nameLabel.text = name
        detailLabel.text = detail
    }
    @IBAction func buttonAction(_ sender: Any) {
       
    }
}

