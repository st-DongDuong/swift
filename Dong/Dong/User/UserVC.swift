//
//  UserVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/4/22.
//

import UIKit

class UserVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configUser()
        
    }
 
    
    
    func configUser(){
        let cell1 = UINib(nibName: "Cell1", bundle: nil)
        tableView.register(cell1, forCellReuseIdentifier: "Cell1")
      
        let cell2 = UINib(nibName: "Cell2", bundle: nil)
        tableView.register(cell2, forCellReuseIdentifier: "Cell2")
        
        let cell3 = UINib(nibName: "Cell3", bundle: nil)
        tableView.register(cell3, forCellReuseIdentifier: "Cell3")
        
        let Footer = UINib(nibName: "Footer", bundle: nil)
        tableView.register(Footer, forCellReuseIdentifier: "Footer")
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

extension UserVC :UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        guard let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1",for: indexPath) as? Cell1 else {
                return Cell1()
            }
            return cell1
        } else if (indexPath.section  == 1 ){

            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as? Cell2 else {
                return Cell2()
            }
            return cell2
        } else if(indexPath.section == 2) {
            guard let cell3 = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as? Cell3 else {
                return Cell3()
            }
            return cell3
        } else {
            guard let Footer = tableView.dequeueReusableCell(withIdentifier: "Footer", for: indexPath) as? Footer else {
                return Footer()
            }
            return Footer
            
        }
        }
}
    extension UserVC: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 0{
                return 80
            }else if(indexPath.section == 1){
                return 120
            } else {
                return 200
            }
    }
    }


