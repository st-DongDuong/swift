//
//  infor.swift
//  Dong
//
//  Created by Dong Duong V. on 5/5/22.
//

import Foundation
import UIKit
struct Restaurant {
    var id: Int
    var name: String
    var description:String
    var address: Address
    var photos: [String]
    var menus: [Menu]
}
struct Address{
    var lat: Double
    var lng: Double
    var address: String
    
}
struct Menu {
    var id : Int?
    var type : Int?
    var name: String?
    var description: String?
    var price: Int?
    var imageUrl: String?
    var discount: Int?
}



