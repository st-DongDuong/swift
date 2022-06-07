//////
//////  HomeViewModel.swift
//////  Dong
//////
//////  Created by Dong Duong V. on 5/30/22.
//////
////
////import Foundation
////
//final class HomeViewModel {
//    var listMenus: [Menu] = []
//    var listBanner: [Banner] = []
//    var listRestaurant: [Restaurant] = []
//    
//    
//    
//    func getListBanner(at index: Int) -> Restaurant {
//        listRestaurant[index]
//    }
//
//    func getlistRestaurant() -> [Restaurant] {
//        listRestaurant
//    }
//
//    func numberOfItemsInSection() -> Int {
//        listBanner.count
//    }
//
//    
//    func getApiRestaurant(completion: @escaping (Bool) -> Void) {
//  
//    }
//    
//    
//    func getApiRestaurant(completion: @escaping (Bool) -> Void) {
//        guard let url = URL(string: "https://ios-interns.herokuapp.com/api/restaurants?page=0&limit=20") else { return }
//        let configuration = URLSessionConfiguration.ephemeral
//        let session = URLSession(configuration: configuration)
//        let task = session.dataTask(with: url) { data, _, error in
//            if error == nil {
//                completion(false)
//            }
//            if let data = data {
//                let decoder = JSONDecoder()
//                if let datas = try? decoder.decode(RestaurantResponse.self, from: data) {
//                    for item in datas.data {
//                        self.listRestaurant.append(item)
//                    }
//                        
//                    DispatchQueue.main.async {
//                        completion(true)
//                    }
//                }
//            }
//        }
//        
//        task.resume()
//    }
//
//    func getApiBanner(completion: @escaping() -> Void) {
//        guard let url = URL(string: "https://ios-interns.herokuapp.com/api/banners") else { return }
//        let configuration = URLSessionConfiguration.ephemeral
//        let session = URLSession(configuration: configuration)
//        let task = session.dataTask(with: url) { data, response, error in // [self]?
//            if let data = data {
//                let decoder = JSONDecoder()
//                if let datas = try? decoder.decode(ListBannerResponse.self, from: data){
//                    for item in datas.data {
//                        self.listBanner.append(item)
//                    }
//                    
//                    DispatchQueue.main.async { //func chay từ trên xuống, khi api về
//                        completion()
//                    }
//                }
//            }
//        }
//        
//        task.resume()
//    }
//}
//
//    func cellForItemAtItemBannerVM(indexPath: IndexPath) -> CustomCollectionBannerVM {
//        CustomCollectionBannerVM(image: listBanner[indexPath.item].imageUrl)
//    }
//
//    func numberOfRowsInSection() -> Int {
//        listRestaurant.count
//    }
//
//    func cellForRowAtTodayCellVM(indexPath: IndexPath) -> TodayTableViewCellVM {
//        TodayTableViewCellVM(menusRes: listRestaurant)
//    }
//
//    func cellForRowAtCustomTableVM(indexPath: IndexPath) -> CustomTableViewModel {
//        CustomTableViewModel(image: listRestaurant[indexPath.row].photos.first ?? "", name: listRestaurant[indexPath.row].name, address: listRestaurant[indexPath.row].address.address)
//    }
//
//}
