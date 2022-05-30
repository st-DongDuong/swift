//
//  HomeViewController.swift
//  Dong
//
//  Created by Dong Duong V. on 5/9/22.
//

import UIKit

class HomeViewController: UIViewController {
    var listMenus: [Menu] = []
    var listBanner: [Banner] = []
    var listRestaurant: [Restaurant] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loadingView: LoadingView!
    @IBOutlet weak var containerLoadingView: UIView!
    
    var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.tintColor = .red
        control.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return control
    }()
    
    @IBAction func addressButton(_ sender: Any) {
        let map = MapVC()
        navigationController?.pushViewController(map, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configCollectionView()
        configTableView()
       // indexPathOfCurrentCell()
        setupPageControl()
        getApiRestaurant()
        getApiBanner()      
        navigationController?.navigationBar.isHidden = true

    }
    
    @IBAction func userButton(_ sender: Any) {
        print("alo")
        let user = UserViewController()
        
        navigationController?.pushViewController(user, animated: true)
    
    }
    
    private func showLoadingView(isShow: Bool) {
        if isShow {
            loadingView.isHidden = false
            containerLoadingView.isHidden = false
            loadingView.startAnimating()
        } else {
            loadingView.isHidden = true
            containerLoadingView.isHidden = true
            loadingView.stopAnimating()
        }
    }

    @objc func refreshData() {
        getApiBanner()
        getApiRestaurant()
        
    }
    
    func getApiBanner() {
        showLoadingView(isShow: true)
        getApiBanner { [weak self] in
            guard let this = self else {
                return
                
            }
            
        this.showLoadingView(isShow: false)
        this.bannerCollectionView.reloadData()
            
        }
    }
    
    func getApiRestaurant() {
        showLoadingView(isShow: true)
        getApiRestaurant { [weak self] isSuccess in
            guard let this = self else {
                return
            }
            
            DispatchQueue.main.async {
                this.showLoadingView(isShow: false)
                this.tableView.reloadData()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                this.refreshControl.endRefreshing()
                this.tableView.contentOffset = .zero
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                this.tableView.scrollsToTop = true
                    }
                })
            }
        }
    }
    
    func configCollectionView() {
        let cellBanner = UINib(nibName: "CustomCollectionBanner", bundle: nil)
        bannerCollectionView.register(cellBanner, forCellWithReuseIdentifier: "CustomCollectionBanner")
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate  = self
    }
    
    func configTableView() {
        let cellTable1 = UINib(nibName: "TodayTableViewCell", bundle: nil)
        tableView.register(cellTable1, forCellReuseIdentifier: "TodayTableViewCell")
        
        let cellTable2 = UINib(nibName: "CustomTableView", bundle: nil)
        tableView.register(cellTable2, forCellReuseIdentifier: "CustomTableView")
        
        let cellHeader = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(cellHeader, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = refreshControl

    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = 5
        pageControl.currentPageIndicatorTintColor = .green
        pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(2)
        pageControl.addTarget(self, action: #selector(pageControlHandle), for: .valueChanged)
        
    }
    
    @objc private func pageControlHandle(sender: UIPageControl) {
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
        self.navigationController?.navigationBar.isHidden = true
    
    }
    
    func getApiRestaurant(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "https://ios-interns.herokuapp.com/api/restaurants?page=0&limit=20") else {
            return
    }
        
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { data, _, error in
            if error == nil {
                completion(false)
    }
            if let data = data {
            let decoder = JSONDecoder()
            if let datas = try? decoder.decode(RestaurantResponse.self, from: data) {
            for item in datas.data {
            self.listRestaurant.append(item)
        
        }
                
        DispatchQueue.main.async {
        completion(true)
                }
            }
        }
    }
        
        task.resume()
    
    }
    
    func getApiBanner(completion: @escaping() -> Void) {
        guard let url = URL(string: "https://ios-interns.herokuapp.com/api/banners") else { return }
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { [self] data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let datas = try? decoder.decode(ListBannerResponse.self, from: data){
                    for item in datas.data {
                        self.listBanner.append(item)
                    }
                    
                    DispatchQueue.main.async {
                        completion()
                    }
                }
                
            }
        }
        task.resume()
    }
}
// MARK: - BannerCollection
extension HomeViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1// trả về 1 section của table trên
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listBanner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionBanner", for: indexPath) as? CustomCollectionBanner else {
            return UICollectionViewCell()
        }
        
        cell.updateBanner(image: listBanner[indexPath.item].imageUrl)
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
        return UIEdgeInsets(top: 20, left: 40, bottom: 5, right: 30)
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
            return listRestaurant.count
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
            
            cell.updateTabel(image: listRestaurant[indexPath.row].photos.first ?? "", name: listRestaurant[indexPath.row].name, address: listRestaurant[indexPath.row].address.address )
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as?
                HeaderView else {
            return UIView()
        }
        if section == 0 {
            headerView.updateHeader(name: "Today New Arivable", detail: "Best of the today food list update")
            headerView.tag = 0
            headerView.delegate = self
        } else {
            headerView.updateHeader(name: "Explore Restaurant", detail: "Check your city Near by Restaurant")
            headerView.tag = 1
          //  headerView.delegate = self
        }
        return headerView
    }
}

extension HomeViewController: TodayTableViewCellDelegate {
    func cell(_ cell: TodayTableViewCell, _ action: TodayTableViewCell.Action) {
        switch action {
        case .didSelect(let restaurant):
            let vc = DetailRestaurant()
            vc.restaurant = restaurant
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
            
        } else {
            
            return 100
            
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70
    }
}

extension HomeViewController: HeaderViewDelegate{
    func view(_view: HeaderView, action: HeaderView.Action) {
        switch action {
        case .seeAll(let tag):
           // if tag == 0 {
                let see = SeeAllViewController()
                navigationController?.pushViewController(see, animated: true)
//                print("---------0----------------\(tag)")
//            } else {
//                print("---------1----------------\(view.tag)")
//            }
        }
    }
    
}

