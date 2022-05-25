//
//  Detail1.swift
//  Dong
//
//  Created by Dong Duong V. on 5/11/22.
//

import UIKit


class CustomDetailRestaurant: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLael: UILabel!
   
    @IBOutlet weak var viewDetail: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 20
   
       // viewDetail.layer.cornerRadius = 16
    }
    
    @IBAction func visitResButton(_ sender: Any) {

    }
    
    func updateCell1(image: String, name: String, address: String){
        imageView.downloaded(from: image)
        nameLael.text = name
        addressLabel.text = address
        
//        delegate?.infor(self ,  .Image(image: image))
//        delegate?.infor( self , .Address(Address: address))
//        delegate?.infor(self, .Name(name: name))


    }
}
