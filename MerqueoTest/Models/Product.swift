//
//  Product.swift
//  MerqueoTest
//
//  Created by John Edwin Guerrero Ayala on 3/26/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import Alamofire
import Realm
import ObjectMapper_Realm
/*
 "id": 1,
 "name": "Galletas chips Minichips Chocolate paquete x 12",
 "price": 7990,
 "stock": 181
 */
class Product: Object, Mappable{
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var price: Int = 0
    @objc dynamic var stock : Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        price <- map["price"]
        stock <- map["stock"]
    }
}
