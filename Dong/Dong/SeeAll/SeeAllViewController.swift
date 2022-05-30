//
//  SeeAllVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/25/22.
//

import UIKit

class SeeAllViewController: UIViewController {
    
    var seeAll: Restaurant?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title  = "sê"
        config()
    
    }
    
    func config() {
        
        let cell  = UINib(nibName: "CustomSeeAll", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier:   "CustomSeeAll")
        tableView.dataSource = self
    
    }
}

extension SeeAllViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        seeAll?.menus.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSeeAll", for: indexPath) as? CustomSeeAll else{
            return UITableViewCell()
        
        }
        
        cell.updateTabel(image: seeAll?.photos.first ?? "" , name: seeAll?.name ?? "" , address: seeAll?.address.address ?? "" )
        return cell
        
        }
}
