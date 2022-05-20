//
//  DetailRes.swift
//  Dong
//
//  Created by Dong Duong V. on 5/11/22.
//

import UIKit

class DetailRestaurant: UIViewController {
    var orderItems :[OrderItem] = []
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var restaurant: Restaurant?
    
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
        
        // Save order  in history
        // 1 Tao Order
        let order = Order(restaurant: restaurant!,
                          paymentDate: Date(),
                          orederItems: orderItems)
        // 2.Save Order
        OrderHistories.orderHistories.append(order)
        print(OrderHistories.orderHistories.first?.restaurant.name)
        let his = OrderHistory()
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
        cartOrder.delegate = self
        cartOrder.modalPresentationStyle = .fullScreen
        present(cartOrder, animated: true, completion: nil)
        collectionView.reloadData()
    }
    
    // MARK: - ConfigDetail
    
    func configDetail() {
        let CustomDetailRestaurant = UINib(nibName: "CustomDetailRestaurant", bundle: nil)
        collectionView.register(CustomDetailRestaurant, forCellWithReuseIdentifier: "CustomDetailRestaurant")
        let CustomRecomendMenu = UINib(nibName: "CustomRecomendMenu", bundle: nil)
        collectionView.register(CustomRecomendMenu, forCellWithReuseIdentifier: "CustomRecomendMenu")
        
        collectionView.register(
            UINib(nibName: "HeaderRecomendMenu", bundle: Bundle.main),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "HeaderRecomendMenu")
        
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
            return restaurant?.menus.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomDetailRestaurant", for: indexPath) as? CustomDetailRestaurant  else {
                return UICollectionViewCell()
            }
            
            cell.updateCell1(image: restaurant?.photos.first ?? "",
                             name: restaurant?.name ?? "",
                             address: restaurant?.address.address ?? "")
            return cell
            
        } else {
            guard  let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomRecomendMenu", for: indexPath) as? CustomRecomendMenu  else {
                return UICollectionViewCell()
            }
            cell2.updateDetail2(img: restaurant?.menus[indexPath.item].imageUrl ?? "",
                                name: restaurant?.menus[indexPath.item].name ?? "",
                                price: restaurant?.menus[indexPath.item].price ?? 0)
            
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
                withReuseIdentifier: "HeaderRecomendMenu", for: indexPath)
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
            let order  = OrderingVC()
            order.delegate = self  // nhận uỷ quyền từ màn hình bên kia
            order.menu = restaurant?.menus[indexPath.item]
           // order.restaurant = restaurant
            
            order.modalPresentationStyle = .fullScreen
            present(order, animated: true, completion: nil)
        }
    }
}
// MARK: -  nhận delegate number và total từ order


extension DetailRestaurant :OrderingDelegate{
    func cell(_ cell: OrderingVC, _ action: OrderingVC.Action) {
        
        switch action {
        case .save(let menuItem, let amount, let notes):
            let orderItem = OrderItem(MenuItem: menuItem, amout: amount, note: notes)
            numberLabel.text = "\(amount)"
            priceLabel.text =  "\(menuItem.price ?? 0 * amount)"
        orderItems.append(orderItem)
            
            print(orderItems.count)
       
        }
    }
}

extension DetailRestaurant: CartVCDelegate {
    func cartdata(_ cart: CartVC, _ Action: CartVC.Action) {
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



