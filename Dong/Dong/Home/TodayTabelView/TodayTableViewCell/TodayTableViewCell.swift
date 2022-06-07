//
//  TodayTableViewCell.swift
//  Dong
//
//  Created by Dong Duong V. on 5/5/22.
//

import UIKit
protocol TodayTableViewCellDelegate : AnyObject{
    func cell(_ cell: TodayTableViewCell,_ action: TodayTableViewCell.Action)
}

class TodayTableViewCell: UITableViewCell {
    
    enum Action  {
        case didSelect(Restaurant)
    }
    
    var menusRes: [Restaurant] = []
    @IBOutlet weak var collectionToday: UICollectionView!
    weak var delegate: TodayTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configToday()
        
    }
    
    func reloadData() {
        collectionToday.reloadData()
    
    }
    
    func configToday() {
        let cell = UINib(nibName: "CustomCollection", bundle: nil)
        collectionToday.register(cell, forCellWithReuseIdentifier: "CustomCollection")
        collectionToday.dataSource = self
        collectionToday.delegate = self
        
    }
}

extension TodayTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menusRes.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollection",
                                                            for: indexPath) as? CustomCollection else {
            
            return UICollectionViewCell()
            
        }
        
        let data = menusRes[indexPath.row]
        cell.updateToday (image: data.photos.first ?? "" , name: data.menus.first?.name ?? "",
                          price: data.menus.first?.price ?? 0)
        return cell
        
    }
}

extension TodayTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 150, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.cell(self, .didSelect(menusRes[indexPath.row]))
    }
}
