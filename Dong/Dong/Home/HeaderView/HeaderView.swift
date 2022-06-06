//
//  HeaderView.swift
//  Dong
//
//  Created by Dong Duong V. on 5/7/22.
//

import UIKit

protocol HeaderViewDelegate: AnyObject{
    func view(_view: HeaderView, action: HeaderView.Action)
}

class HeaderView: UITableViewHeaderFooterView {

    enum Action{
        case seeAll(tag: Int)
    }
    
    @IBOutlet weak var menuDetail: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    weak var delegate:HeaderViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundView = UIView(frame: self.bounds)
        self.backgroundView?.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
    }
    
    func updateHeader(name: String, detail: String ){
        titleLabel .text = name
        detailLabel.text = detail
    }

    @IBAction func seeAllButton(_ sender: Any) {
        delegate?.view(_view: self, action: .seeAll(tag: tag))
    }
}
