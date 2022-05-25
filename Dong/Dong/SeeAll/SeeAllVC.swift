//
//  SeeAllVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/25/22.
//

import UIKit

class SeeAllVC: UIViewController {
    
    var seeAll: Restaurant?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func config(){
        let cell  = UINib(nibName: "CustomSeeAll", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier:   "CustomSeeAll")
   
        //tableView.dataSource = self
    
    }
}
//extension SeeAllVC : UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        1
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}
