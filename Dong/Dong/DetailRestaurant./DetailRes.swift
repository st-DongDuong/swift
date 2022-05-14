//
//  DetailRes.swift
//  Dong
//
//  Created by Dong Duong V. on 5/11/22.
//

import UIKit

class DetailRes: UIViewController {
    
    var restaurant: Restaurant?
    
    @IBOutlet weak var viewFooter: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configDetail()
        navigationController?.navigationBar.isHidden = true
        viewFooter.layer.cornerRadius = 20
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    @IBAction private func  backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func configDetail(){
        let cell1 = UINib(nibName:"Detail1", bundle: nil)
        collectionView.register(cell1, forCellWithReuseIdentifier: "Detail1")
        let cell2 = UINib(nibName: "Detail2", bundle: nil)
        collectionView.register(cell2, forCellWithReuseIdentifier: "Detail2")
        
        collectionView.register(
            UINib(nibName: "HeaderDetailCollection", bundle: Bundle.main),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "HeaderDetailCollection"
        )
        
        collectionView.register(
            UINib(nibName: "Header", bundle: Bundle.main),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "Header")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension DetailRes :UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return restaurant?.menus.count ?? 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            
            guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Detail1", for: indexPath) as? Detail1  else {
                return UICollectionViewCell()
            }
            cell.updateCell1(image: restaurant?.photos.first ?? "",
                             name: restaurant?.name ?? "",
                             address: restaurant?.address.address ?? "")
            return cell
            
        } else {
            guard  let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Detail2", for: indexPath) as? Detail2  else {
                return UICollectionViewCell()
            }
            cell2.updateDetail2(img: restaurant?.menus[indexPath.item].imageUrl ?? "",
                                name: restaurant?.menus[indexPath.item].name ?? "",
                                price: restaurant?.menus[indexPath.item].price ?? 0)
            return cell2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0{
            return CGSize (width: 0, height: 0)
        }else{
            return CGSize (width: collectionView.bounds.width, height: 70)
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {       if indexPath.section == 0 {
        let Header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "Header", for: indexPath)
        return Header
    } else {
        let HeaderDetailCollection = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "HeaderDetailCollection", for: indexPath)
        return HeaderDetailCollection
    }
    }
}

extension DetailRes: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: 380, height: 360)
        } else {
            return CGSize(width: UIScreen.main.bounds.width / 2 - 12, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0{
            return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        } else {
            return UIEdgeInsets(top: 12, left: 8, bottom: 6, right: 8)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(restaurant?.menus[indexPath.row])
        if indexPath.section != 0 {
            let order  = Ordering()
            order.menu = restaurant?.menus[indexPath.item]
            order.modalPresentationStyle = .fullScreen
            present(order, animated: true, completion: nil)
        }
    }
}
