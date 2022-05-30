//
//  CustomSeeAll.swift
//  Dong
//
//  Created by Dong Duong V. on 5/28/22.
//

import UIKit

class CustomSeeAll: UITableViewCell {

    @IBOutlet weak var addressSeeAll: UILabel!
    @IBOutlet weak var nameSeeAll: UILabel!
    @IBOutlet weak var imageSeeAll: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updataSeeAll(imga:String, name:String, address:String){
        guard let url = URL(string: imga) else { return }
        imageSeeAll.downloaded(from: url)
        nameSeeAll.text = name
        addressSeeAll.text = address
    }
}
