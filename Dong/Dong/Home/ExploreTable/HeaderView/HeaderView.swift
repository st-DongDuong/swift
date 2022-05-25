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
        backgroundView = UIView(frame: self.bounds)
        self.backgroundView?.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        // Initialization code
    }
    
    func updateHeader(name: String, detail: String ){
        titleLabel .text = name
        detailLabel.text = detail
    }
    @IBAction func seeAllButton(_ sender: Any) {
        let vc  = SeeAllVC()
       // vc.seeAll = listBanner
    
    }
}
