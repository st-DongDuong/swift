//
//  HomeViewController.swift
//  BTTongHop
//
//  Created by Dong Duong V. on 18/04/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var menuCollection: UICollectionView!
    @IBOutlet weak var bannerCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title =  " Home"
        configTabbar()
        registerCollection()
    }
    func configTabbar(){
        navigationController?.navigationBar.backgroundColor = .cyan
        let cart = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 50))
        cart.addTarget(self, action: #selector(cartButton), for: .touchUpInside)
        cart.setImage(UIImage(named: "car"), for: .normal)
        
        let rightCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        rightCustomView.bounds = rightCustomView.bounds.offsetBy(dx: -20, dy: 0)
        rightCustomView.addSubview(cart)
        
        let rightButton = UIBarButtonItem(customView: rightCustomView)
        navigationItem.rightBarButtonItem = rightButton
        
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
        
        // dky Header của menu  "Restaurant"
        menuCollection.register(UINib(nibName: "Header", bundle: Bundle.main),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "Header")
        
        bannerCollection.dataSource = self
        bannerCollection.delegate = self
        
        menuCollection.dataSource = self
        menuCollection.delegate = self
    }
    
    @IBAction func rightButton(_ sender: Any) {
        guard var currentIndexPath = bannerCollection.indexPathsForVisibleItems.last else { return }
        print(currentIndexPath)
        currentIndexPath.item -= 1
        if currentIndexPath.item >= 0 {
            self.bannerCollection.scrollToItem(at: currentIndexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
        }
    }
    @IBAction func leftButton(_ sender: Any){
        guard var currentIndexPath = bannerCollection.indexPathsForVisibleItems.first else { return }
        print(currentIndexPath)
        currentIndexPath.item += 1
        if currentIndexPath.item < 3 {
            self.bannerCollection.scrollToItem(at: currentIndexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
        }
    }
}

extension HomeViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == menuCollection {
            return 3
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollection {
            return 2
        }else{
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  collectionView == menuCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath)
            //cell.largeContentTitle = "alo"
            cell.backgroundColor =  .gray
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath)
            
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "Header", for: indexPath)
        return header
    }
}
extension HomeViewController :UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == menuCollection {
            
            let b  =  (Int(UIScreen.main.bounds.width) - 67 ) / 2
            return CGSize(width: b, height: 300)
        } else {
            let width  =  bannerCollection.bounds.size.width - 20
            let heigh = bannerCollection.bounds.size.height
            return CGSize(width: width , height: heigh)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == menuCollection {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }else {
            return UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
        }
    }

}
