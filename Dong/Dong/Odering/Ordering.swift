//
//  Ordering.swift
//  Dong
//
//  Created by Dong Duong V. on 5/12/22.
//

import UIKit

//protocol OrderingDelegate: AnyObject

class Ordering: UIViewController {

    @IBOutlet weak var headerView: UIView!
   
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var imageTest: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var menu: Menu?

    var number:Int = 0
    var total: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        headerView.layer.cornerRadius = 10
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        footerView.layer.cornerRadius = 15
        footerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner ]
    }

    @IBAction func pop(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func updateView() {
        imageTest.downloaded(from: menu?.imageUrl ?? "")
        nameLabel.text = menu?.name
        priceLabel.text = "\(menu?.price)"
        
    }
    

    
    @IBAction func minusOrder(_ sender: Any) {
        if number > 0 {
            number -= 1
            numberLabel.text = "\(number)"

        }
            
    }
    
    @IBAction func plusOrder(_ sender: Any) {
        number += 1
        numberLabel.text = "\(number)"
    }
   
    @IBAction func totalButton(_ sender: Any) {
        totalLabel.text = "total: \((menu?.price ?? 0) * number)"
    
    }
    
}
