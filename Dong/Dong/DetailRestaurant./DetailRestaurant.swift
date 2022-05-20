//
//  DetailRes.swift
//  Dong
//
//  Created by Dong Duong V. on 5/11/22.
//

import UIKit

class DetailRestaurant: UIViewController {

    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
   var restaurant: Restaurant = Restaurant(id: 0, name: "", description: "", address: Address(lat: 0, lng: 0, address: ""), photos: [], menus: [])
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var viewFooter: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configDetail()
        navigationController?.navigationBar.isHidden = true
        viewFooter.layer.cornerRadius = 20
        self.tabBarController?.tabBar.isHidden = true
        headerView.layer.cornerRadius = 16
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner ]
        
    }

    // MARK: - checkOutButton
    
    @IBAction func checkOutButton(_ sender: Any) {
        let his = CartVC  ()
//        CartData.cart.forEach { cart in
           //if let index = HistoryRestaurantData.orderHistories.firstIndex(where: { $0.id == restaurant.id}) {
////                if let index = HistoryRestaurantData.listRestaurant[index].orederItems.firstIndex(where: {$0.menuItem.id == cart.menuItem.id}) {
////                    HistoryRestaurantData.listRestaurant[index].orederItems[index] = cart
////                } else {
////                    HistoryRestaurantData.listRestaurant[index].orederItems.append(cart)
////                }
//                HistoryRestaurantData.orderHistories[index].orederItems.append(cart)
//            } else {
//                HistoryRestaurantData.orderHistories.append(.init(nameStore: restaurant.name, id: restaurant.id, orderDate: "" , address: restaurant.address.address, imgStore: restaurant.photos.first!, orederItems: [cart]))
//            }
//        }
        his.modalPresentationStyle = .fullScreen
        present(his, animated: true, completion: nil)    }
    
    // MARK: - backButton
    @IBAction private func  backButton(_ sender: UIButton) {
        tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    // MARK: - cartButtonTotal
    @IBAction func cartButton(_ sender: Any) {
        let cartOrder = CartVC()
        cartOrder.cartDetail = restaurant
        //cartOrder.delegate = self
        cartOrder.modalPresentationStyle = .fullScreen
        present(cartOrder, animated: true, completion: nil)
        
    }
    
    // MARK: - ConfigDetail
    
    func configDetail() {
        let cell1 = UINib(nibName:"Detail1", bundle: nil)
        collectionView.register(cell1, forCellWithReuseIdentifier: "Detail1")
        let cell2 = UINib(nibName: "Detail2", bundle: nil)
        collectionView.register(cell2, forCellWithReuseIdentifier: "Detail2")
        
        collectionView.register(
            UINib(nibName: "HeaderDetailCollection", bundle: Bundle.main),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "HeaderDetailCollection")
        
        collectionView.register(
            UINib(nibName: "Header", bundle: Bundle.main),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "Header")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension DetailRestaurant :UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return restaurant.menus.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Detail1", for: indexPath) as? Detail1  else {
                return UICollectionViewCell()
            }
            
            cell.updateCell1(image: restaurant.photos.first ?? "",
                             name: restaurant.name ?? "",
                             address: restaurant.address.address ?? "")
            return cell
            
        } else {
            guard  let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Detail2", for: indexPath) as? Detail2  else {
                return UICollectionViewCell()
            }
            cell2.updateDetail2(img: restaurant.menus[indexPath.item].imageUrl ?? "",
                                name: restaurant.menus[indexPath.item].name ?? "",
                                price: restaurant.menus[indexPath.item].price ?? 0)
            
            return cell2
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize (width: 0, height: 0)
        } else {
            return CGSize (width: collectionView.bounds.width, height: 70)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
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

extension DetailRestaurant: UICollectionViewDelegateFlowLayout{
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
            return UIEdgeInsets(top: 12, left: 10, bottom: 6, right: 8)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("BẤM VÀO CELL COLLEC VÀ TRUYÊN DỮ LIỆU THUẬN")
        // MARK: - push qua Order
        
        if indexPath.section != 0 {
            let order  = Ordering()
            order.delegate = self  // nhận uỷ quyền từ màn hình bên kia
            order.menu = restaurant.menus[indexPath.item]
            order.restaurant = restaurant
            
            order.modalPresentationStyle = .fullScreen
            present(order, animated: true, completion: nil)
        }
    }
}
// MARK: -  nhận delegate number và total từ order


extension DetailRestaurant :OrderingDelegate{
    func cell(_ cell: Ordering, _ action: Ordering.Action) {
        
        switch action {
        case .total(let number):
            //  print("màn hình detail\(number) ")
            numberLabel.text = "\(number)"
            print("recive delege from Ordering \(number) ")
            
        case .price(let totaly ):
            priceLabel.text = "Check out  \(totaly).000đ"
            print("recive delege from Ordering \(totaly)")
        }
    }
}

extension DetailRestaurant: CartVCDelegate {
    func cart(_ cart: CartVC, _ Action: CartVC.Action) {
        switch Action{
        case.totalAmount(let totalAmount):
            numberLabel.text = "\(totalAmount)"
            print("recive delegate from Cart \(totalAmount)")
        case .Order( let price ):
            priceLabel.text = "check out \(price).000đ"
            print("recive delegate from Cart \(price)")
            collectionView.reloadData()
        }
    }
}



