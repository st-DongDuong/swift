//
//  FoodCollectionViewCell.swift
//  BTTongHop
//
//  Created by Dong Duong V. on 4/19/22.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {

        var number: Int = 0
        var price: Int = 0
        var favorite: Bool = false
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var giamButoon: UIButton!
    @IBOutlet weak var priceFood: UILabel!
    @IBOutlet weak var nameFood: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() { //cài hình thành tròn
        super.layoutSubviews()
        layoutIfNeeded()
//      foodImage.layer.cornerRadius = foodImage.frame.width / 2
        foodImage.clipsToBounds = true
        foodImage.contentMode = .scaleToFill
    }
func setData(img: UIImage, name: String, price: Int, number: Int, isFavorite: Bool) { // set dữ liệu của kéo thả cho file MEnu đã taọ
    
          foodImage.image  = img
          nameFood.text = name
          priceFood.text = "\(price)"
          totalLabel.text = "\(number)"
          self.number = number
  //        self.price = price}
    
    // set trai tim nếu đúng faveoro thì tim đỏ else trắng
    let image = isFavorite ? UIImage(named: "Vector") :UIImage(named: "Vector2")
    favoriteButton.setImage(image, for: .normal)
}
}
