//
//  DetailViewController.swift
//  TableView
//
//  Created by Dong Duong V. on 4/30/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var Image: UIImageView!
    var imgDetail = UIImage()
    var nameDe = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameDetail.text = "Bạn đã chọn\(nameDe)"
        Image.image = imgDetail
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
