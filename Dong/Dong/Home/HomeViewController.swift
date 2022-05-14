//
//  HomeViewController.swift
//  Dong
//
//  Created by Dong Duong V. on 5/9/22.
//

import UIKit

class HomeViewController: UIViewController {
    var listMenus: [Menu] = []
    var listRestaurant: [Restaurant] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configCollectionView()
        configTableView()
        setupPageControl()
        getRestaurants()
        
       // self.navigationController?.isNavigationBarHidden = true
       // self.tabBarController?.tabBar.isHidden = true
        
    }
    
    func configCollectionView(){
        let cellBanner = UINib(nibName: "CustomCollectionBanner", bundle: nil)
        bannerCollectionView.register(cellBanner, forCellWithReuseIdentifier: "CustomCollectionBanner")
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate  = self
    }
    
    func configTableView() { // dky 2 table ở dưới
        let cellTable1 = UINib(nibName: "TodayTableViewCell", bundle: nil)
        tableView.register(cellTable1, forCellReuseIdentifier: "TodayTableViewCell")
        
        let cellTable2 = UINib(nibName: "CustomTableView", bundle: nil)
        tableView.register(cellTable2, forCellReuseIdentifier: "CustomTableView")
        
        let cellHeader = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(cellHeader, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
    private func setupPageControl() {
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = .green
        pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(2)
        pageControl.addTarget(self, action: #selector(pageControlHandle), for: .valueChanged)
    }
    
    @objc private func pageControlHandle(sender: UIPageControl){
        guard let indexPath = indexPathOfCurrentCell() else { return }
        pageControl.currentPage = indexPath.row
    }
    
    private func indexPathOfCurrentCell() -> IndexPath? {
        var visbleOffset = bannerCollectionView.contentOffset
        visbleOffset.x += bannerCollectionView.center.x
        visbleOffset.y += bannerCollectionView.center.y
        bannerCollectionView.indexPathForItem(at: visbleOffset)
        guard let indexPath = bannerCollectionView.indexPathForItem(at: visbleOffset) else {
            return nil
        }
        return indexPath
    }
    // MARK: - Navigation
    
    private func configNavigationBar() {
        self.navigationItem.title = "Home"
        
        let image1 = UIBarButtonItem(image: UIImage(named: "left"), style: .plain, target: self, action: #selector(leftButton))
        image1.tintColor = .black
        navigationItem.leftBarButtonItem = image1
        let image2 = UIBarButtonItem(image: UIImage(named: "person")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(rightButton))
        image2.tintColor = .black
        navigationItem.rightBarButtonItem = image2
        
    }
    
    @objc func rightButton(){
        let map = MapVC()
        navigationController?.pushViewController(map, animated: true)
        print("tap in image2")
    }
    
    @objc func leftButton(){
        print("tap in image1")
    }
    
    private func getRestaurants() {
        getAPI { [weak self] newList in
            guard let this = self else { return }
            this.listRestaurant = newList
            this.tableView.reloadData()
        }
    }
    
    // MARK: - getApi
    func getAPI(completion: @escaping ([Restaurant]) -> ()) {
        guard let url = URL(string: "https://ios-interns.herokuapp.com/api/restaurants") else {
            return
        }
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { [self] data, response, error in
            print(data)
            if let data = data {
                let json = self.converToJson(from: data)
                print(json)
                if let datas = json["data"] as? [[String:Any]] {// vì data dang trả vể mảng dic(key:value)
                    for data in datas {
                        print (data)    // data.count in 6 cai??/
                        let id = data["id"] as? Int
                        let name = data["name"] as? String
                        let description  = data ["description"] as? String
                        let address = data["address"] as? [String: Any]
                        let lat = address?["lat"] as? Double ?? 0.0
                        let lng = address?["lng"] as? Double ?? 0.0
                        let addressAdd  = address?["address"] as? String
                        let photos = data["photos"] as? [String]
                       if let menus = data["menus"] as? [[String: Any]] {
                            print (menus)
                           for menu in menus{
                               let id1  = menu["id"] as? Int
                               let type1 = menu["type"] as? Int
                               let name1 = menu["name"] as? String
                               let description1 = menu ["description"] as? String
                               let price1 = menu["price"] as? Int
                               let imageURL1 = menu["imageUrl"] as? String
                               let discount1 = menu["discount"] as? Int
                               
                               let listMenu = Menu(id: id1 , type: type1  , name: name1 , description: description1 , price: price1 , imageUrl: imageURL1  , discount: discount1 )
                               self.listMenus.append(listMenu)
                           }
                           print(listMenus)
                        }
                        let listRes = Restaurant(id: id ?? 0 , name: name ?? "", description: description ?? "" , address: Address(lat: lat, lng: lng, address: addressAdd ?? "" ), photos: photos ?? [] , menus: listMenus)
                        self.listRestaurant.append(listRes)
                    }
                DispatchQueue.main.async {
                    completion(self.listRestaurant)
                }
             }
          }
        }
        task.resume()
        
    }
}

//func getAPI(completion: @escaping ([Menu]) -> ()) {
//    guard let url = URL(string: "https://ios-interns.herokuapp.com/api/restaurants") else {
//        return
//    }
//    let configuration = URLSessionConfiguration.ephemeral
//    let session = URLSession(configuration: configuration)
//    let task = session.dataTask(with: url) { [self] data, response, error in
//        print(data)
//        if let data = data {
//            let json = self.converToJson(from: data)
//            print(json)
//            if let datas = json["data"] as? [[String:Any]] {// vì data dang trả vể mảng dic(key:value)
//                    print (data)    // data.count in 6 cai??/
//                    let id = data["id"] as? Int
//                    let name = data["name"] as? String
//                    let description  = data ["description"] as? String
//                    let address = data["address"] as? [String: Any]
//                    let lat = address?["lat"] as? Double ?? 0.0
//                    let lng = address?["lng"] as? Double ?? 0.0
//                    let addressAdd  = address?["address"] as? String
//                    let photos = data["photos"] as? [String]
//          for photo in photos {
//            let listPhoto = Menu(id: <#T##Int?#>, type: <#T##Int?#>, name: <#T##String?#>, description: <#T##String?#>, price: <#T##Int?#>, imageUrl: <#T##String?#>, discount: <#T##Int?#>)
//            self.listMenus.append(list)
//          }
//        }
//      }
//      DispatchQueue.main.async {
//        completion()
//      }
//    }
//    task.resume()
//  }

// MARK: - BannerCollection
extension HomeViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1// trả về 1 section của table trên
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionBanner", for: indexPath) as? CustomCollectionBanner else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) { // thêm thằng ni mới scroll ở trên dc
        guard let indexPath = indexPathOfCurrentCell() else { return }
        pageControl.currentPage = indexPath.row
    }
}
// MARK: - DelegateBanner

extension HomeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
// MARK: - tableView
extension HomeViewController:  UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodayTableViewCell") as? TodayTableViewCell else {
                return UITableViewCell()
            }
            cell.menusRes = listRestaurant
            cell.reloadData()
            cell.delegate = self
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableView") as? CustomTableView else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView else {
            
            return UIView()
        }
        if section == 0 {
            headerView.updateHeader(name: "Today New Arivable", detail: "Best of the today food list update")
            
        } else {
            headerView.updateHeader(name: "Explore Restaurant", detail: "Check your city Near by Restaurant")
        }
        return headerView
    }
}

extension HomeViewController: TodayTableViewCellDelegate {
    func cell(_ cell: TodayTableViewCell, _ action: TodayTableViewCell.Action) {
        switch action {
        case .didSelect(let restaurant):
        
            print(restaurant.name)
            let vc = DetailRes()
            // Truỳen dữ liệu
            vc.restaurant = restaurant
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 230
        }else{
            return 120
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70
    }
}
// MARK: - Json
extension HomeViewController {
    func converToJson(from data: Data) -> [String: Any] {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                json = jsonObj
            }
        }catch {
            print("Json error")
        }
        
        return json
    }
}


