//
//  infor.swift
//  Dong
//
//  Created by Dong Duong V. on 5/5/22.
//

import Foundation
import UIKit

struct Restaurant: Codable {
    var id: Int
    var name: String
    var address: Address
    var photos: [String]
    var menus: [Menu]
}

struct Address: Codable {
    var lat: String = ""
    var lng: String = ""
    var address: String = ""
}

struct Menu: Codable {
    var id: Int = 0
    var type: Int = 0
    var name: String = ""
    var description: String = ""
    var price: Int = 0
    var imageUrl: String = ""
    var discount: Int = 0
}

struct RestaurantResponse: Codable {
    var data: [Restaurant]
}

struct Banner: Codable {
    var id: Int = 0
    var imageUrl: String = ""
}

struct ListBannerResponse: Codable {
    var data: [Banner]
}



