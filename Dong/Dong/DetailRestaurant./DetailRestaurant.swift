//
//  DetailRes.swift
//  Dong
//
//  Created by Dong Duong V. on 5/11/22.
//

import UIKit
class DetailRestaurant: UIViewController {
   
    var orderItems :[OrderItem] = []
    var restaurant: Restaurant?
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var viewFooter: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        if orderItems.isEmpty == true {
            viewFooter.isHidden = true
            
        } else {
            
            viewFooter.isHidden = false
        }
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDetail()
        navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        viewFooter.layer.cornerRadius = 20
        headerView.layer.cornerRadius = 16
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner ]
        update()
        
    }
    
    @IBAction func checkOutButton(_ sender: Any) {
        let order = Order(restaurant: restaurant!,
                          paymentDate: Date(),
                          orderItems: orderItems)
        
        OrderHistories.orderHistories.append(order)
        orderItems.removeAll()
        update()
        print(OrderHistories.orderHistories)
        
    }
    
    @IBAction private func  backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - cartButtonTotal
    @IBAction func cartButton(_ sender: Any) {
        let cartOrder = CartViewController()
        //        cartOrder.cartDetail = restaurant
        cartOrder.orderItems = orderItems
        cartOrder.delegate = self
        
        cartOrder.modalPresentationStyle = .fullScreen
        present(cartOrder, animated: true, completion: nil)
        collectionView.reloadData()
        
    }
    
    func configDetail() {
        let CustomDetailRestaurant = UINib(nibName: "CustomDetailRestaurant", bundle: nil)
        collectionView.register(CustomDetailRestaurant, forCellWithReuseIdentifier: "CustomDetailRestaurant")
        
        let CustomRecomendMenu = UINib(nibName: "CustomRecomendMenu", bundle: nil)
        collectionView.register(CustomRecomendMenu, forCellWithReuseIdentifier: "CustomRecomendMenu")
        
        collectionView.register (
            UINib(nibName: "HeaderRecomendMenu", bundle: Bundle.main),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "HeaderRecomendMenu")
        
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
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomDetailRestaurant", for: indexPath) as? CustomDetailRestaurant  else {
                
                return UICollectionViewCell()
            }
            
            cell.updateCell1(image: restaurant?.photos.first ?? "",name: restaurant?.name ?? "",
                             address: restaurant?.address.address ?? "")
            return cell
            
        } else {
            
            guard let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomRecomendMenu", for: indexPath) as? CustomRecomendMenu  else {
                return UICollectionViewCell()
            }
            
            let data = restaurant?.menus[indexPath.item]
            cell2.updateDetail2(img: data?.imageUrl ?? "", name: data?.name ?? "", price:data?.price ?? 0)
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
        let HeaderDetailCollection = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,withReuseIdentifier: "HeaderRecomendMenu", for: indexPath)
        return HeaderDetailCollection
    }
}

extension DetailRestaurant: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: 360)
            
        } else {
            
            return CGSize(width: UIScreen.main.bounds.width / 2 - 14, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            
            return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 14)
            
        } else {
            
            return UIEdgeInsets(top: 12, left: 10, bottom: 6, right: 9)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            let order  = OrderingViewController()
            order.delegate = self
            order.menu = restaurant?.menus[indexPath.item]
            order.modalPresentationStyle = .fullScreen
            present(order, animated: true, completion: nil)
        }
    }
    
    func update() {
        var totalPrice = 0
        var number = 0
        
        orderItems.forEach { item in
            totalPrice += item.amout * item.MenuItem.price
            number += item.amout
        }
        
        priceLabel.text =  "check out: \(totalPrice),000đ"
        numberLabel.text = "\(number)"
    }
}

extension DetailRestaurant :OrderingDelegate {
    func cell(_ cell: OrderingViewController, _ action: OrderingViewController.Action) {
        switch action {
        case .save(let menuItem, let amount, let notes, let totalprice):
            let orderItem = OrderItem(MenuItem: menuItem, amout: amount, note: notes)
            orderItems.append(orderItem)
            update()
        }
    }
}

extension DetailRestaurant: CartViewControllerDelegate {
    func cartdata(_ cart: CartViewController, _ Action: CartViewController.Action) {
        switch Action {
        case .totalAmount(let totalAmount, let number ):
            numberLabel.text = "\(totalAmount )"
            priceLabel.text = "Check Out: \(number),000đ"
            collectionView.reloadData()
        case .reload:
            numberLabel.text = "0"
            priceLabel.text = "Check Out: "
            collectionView.reloadData()
        }
    }
}

