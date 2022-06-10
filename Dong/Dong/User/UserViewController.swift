//
//  UserVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/4/22.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configUser()
        navigationController?.navigationBar.isHidden = true
    }
    
    func configUser() {
        let InforUser = UINib(nibName: "InforUser", bundle: nil)
        tableView.register(InforUser, forCellReuseIdentifier: "InforUser")
        
        let AcountSetting = UINib(nibName: "AcountSetting", bundle: nil)
        tableView.register(AcountSetting, forCellReuseIdentifier: "AcountSetting")
        
        let More = UINib(nibName: "More", bundle: nil)
        tableView.register(More, forCellReuseIdentifier: "More")
        
        let LogOut = UINib(nibName: "LogOut", bundle: nil)
        tableView.register(LogOut, forCellReuseIdentifier: "LogOut")
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

extension UserViewController :UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let InforUser = tableView.dequeueReusableCell(withIdentifier: "InforUser",for: indexPath) as? InforUser else {
                return InforUser()
            }
            
            return InforUser
            
        } else if (indexPath.section  == 1 ) {
            guard let AcountSetting = tableView.dequeueReusableCell(withIdentifier: "AcountSetting", for: indexPath) as? AcountSetting else {
                return AcountSetting()
            }
            
            return AcountSetting
            
        } else if (indexPath.section == 2) {
            guard let More = tableView.dequeueReusableCell(withIdentifier: "More", for: indexPath) as? More else {
                
                return More()
            }
            
            return More
            
        } else {
            guard let LogOut = tableView.dequeueReusableCell(withIdentifier: "LogOut" , for: indexPath) as? LogOut  else {
                
                return LogOut()
            }
            
            return LogOut
        }
    }
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 80
            
        } else if(indexPath.section == 1) {
            
            return 120
            
        } else {
            
            return 200
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        
        200
    }
}


