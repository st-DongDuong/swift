//
//  HeaderRecomendMenu.swift
//  Dong
//
//  Created by Dong Duong V. on 5/20/22.
//

import UIKit
protocol HeaderRecomendMenuDelegate: AnyObject{
    func detail(detail:HeaderRecomendMenu, action: HeaderRecomendMenu.Action )
}

class HeaderRecomendMenu: UICollectionReusableView {

    enum Action{
        case data
    }
    
    weak var delegate:HeaderRecomendMenuDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func detailMenuButton(_ sender: Any) {
        delegate?.detail(detail: self, action: .data)

    }
}
