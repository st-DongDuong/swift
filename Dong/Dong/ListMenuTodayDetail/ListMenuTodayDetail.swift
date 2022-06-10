//
//  ListMenuTodayDetail.swift
//  Dong
//
//  Created by Dong Duong V. on 5/30/22.
//

import UIKit

class ListMenuTodayDetail: UIViewController {

    @IBOutlet weak var headerListMenu: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
  
    var listMenu: [Restaurant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configCollection()
        self.navigationItem.title  = "ListMenuTodayDetail"
    
        headerListMenu.layer.cornerRadius = 15
        headerListMenu.clipsToBounds  = true
        headerListMenu.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    
    }
    
    func configCollection() {
        let cell = UINib(nibName: "CustomRecomendMenu", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "CustomRecomendMenu")
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ListMenuTodayDetail :UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomRecomendMenu", for: indexPath) as? CustomRecomendMenu else {
            
            return UICollectionViewCell()
    }
        cell.updateDetail2(img: listMenu[indexPath.item].photos.first ?? "" ,
                           name: listMenu[indexPath.item].menus.first?.name ?? "" ,
                           price: listMenu[indexPath.item].menus.first?.price ?? 0)
        return cell
    }
}

extension ListMenuTodayDetail: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 12, left: 10, bottom: 6, right: 9)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: 200)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let vc  = DetailRestaurant()
        vc.restaurant = listMenu[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
    }
}
