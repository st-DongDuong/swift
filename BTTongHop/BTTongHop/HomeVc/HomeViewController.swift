//
//  HomeViewController.swift
//  BTTongHop
//
//  Created by Dong Duong V. on 18/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    var listMenu: [Menu] = []
    var lasrOder:  [Menu] = []
    @IBOutlet weak var menuCollection: UICollectionView!
    @IBOutlet weak var bannerCollection: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title =  " Home"
        let cartButton = UIBarButtonItem(image: UIImage(named: "car"), style: .done, target: self, action: #selector(cartButton))
        cartButton.tintColor = UIColor(red: 0.486, green: 0.525, blue: 0.569, alpha: 1)
        navigationItem.rightBarButtonItem = cartButton
        
        registerCollection() //dky cellBanner vs Menu

    }
    @objc func cartButton() {
        print("button in cart")
    }
    
    func registerCollection() {
        // dky cell Banner
        let cellBanner = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        bannerCollection.register(cellBanner, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        
        // đky cell Menu
        let cellMenu = UINib(nibName: "MenuCollectionViewCell", bundle: nil)
        menuCollection.register(cellMenu, forCellWithReuseIdentifier: "MenuCollectionViewCell")
        
        menuCollection.register(UINib(nibName: "FoodCollectionViewCell" , bundle: nil), forCellWithReuseIdentifier: "Food")
       
        // dky Header của menu  "Restaurant"
//        menuCollection.register(UINib(nibName:" HeaderCollectionReusableView", bundle: Bundle.main),
//                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                                withReuseIdentifier: "Header")
//        
        bannerCollection.dataSource = self
        bannerCollection.delegate = self
        menuCollection.dataSource = self
        menuCollection.delegate = self
    }
    
    func setUpData(){
        listMenu = [Menu(name: "cake1", price: 1000, img: UIImage(named: "cake1")!, number: 0, favorite: false),
                    Menu(name: "cake2", price: 2000, img: UIImage(named: "cake2")!, number: 0, favorite: false),
                    Menu(name: "cake3", price: 3000, img: UIImage(named: "cake3")!, number: 0, favorite: false),
                    Menu(name: "cake2", price: 2000, img: UIImage(named: "cake2")!, number: 0, favorite: false),
                    Menu(name: "cake3", price: 3000, img: UIImage(named: "cake3")!, number: 0, favorite: false),
                    Menu(name: "cake2", price: 2000, img: UIImage(named: "cake2")!, number: 0, favorite: false),
                    Menu(name: "cake3", price: 3000, img: UIImage(named: "cake3")!, number: 0, favorite: false),
                    Menu(name: "cake4", price: 4000, img: UIImage(named: "cake4")!, number: 0, favorite: false),]
    }
}

extension HomeViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == menuCollection {
            return 2
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollection {
            if section == 0 {
                return listMenu.count
            }else{
                return 4//  trả về ds last order
            }
            
        }else{
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  collectionView == menuCollection {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Food", for: indexPath) as? FoodCollectionViewCell
            if (indexPath.section == 0){
                
                let menu = listMenu[indexPath.item]
                cell?.setData(img: menu.img,
                              name: "\(menu.name)",
                              price: menu.price,
                              number: menu.number,
                              isFavorite: menu.favorite)
                
            }
            return cell ?? FoodCollectionViewCell()
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
                       let indexPathItem = indexPath.item
                       switch indexPathItem{
                       case 0:
                           cell.bannerIMG(img: UIImage(named: "banner")!)
                       case 1:
                           cell.bannerIMG(img: UIImage(named: "banner")!)
                       case 2:
                           cell.bannerIMG(img: UIImage(named: "banner")!)
                       default:
                            return cell
                       }
            
                return cell
    }
    }


}
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        if collectionView == menuCollection {
            let leftSpacing = 20
            let width  = (Int(UIScreen.main.bounds.width) - (leftSpacing * 2) - 5) / 3
            let height = bannerCollection.bounds.size.height
            return CGSize(width: width + 20, height: 150)
        } else {
//            let width  =  bannerCollection.bounds.size.width + 40
//            let heigh = bannerCollection.bounds.size.height
            return CGSize(width: bannerCollection.frame.width + 20 , height: bannerCollection.frame.height)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == menuCollection {
            return UIEdgeInsets(top: 17, left: 10, bottom: 20, right: 10)
        }else {
            return UIEdgeInsets(top:0 , left: 0, bottom: 0, right: 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            if collectionView == menuCollection {
                return CGSize(width: 10, height: 19)
            }else {
                return  .zero
            }
        }

}
