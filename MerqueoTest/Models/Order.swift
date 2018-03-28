//
//  Order.swift
//  MerqueoTest
//
//  Created by John Edwin Guerrero Ayala on 3/27/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import Foundation

struct InCartProduct{
    var productId : Int = 0
    var product : Product
    var singleCost : Int = 0
    var quantity : Int = 0
}

class Order {

    var products = [InCartProduct]()
    
    var total: Int{
        get{
            var currentTotal = 0
            for product in products{
                currentTotal = product.quantity * product.singleCost
            }
            return currentTotal
        }
    }
    
    static var sharedInstance = Order()
    
    func addProductToOrder(product: Product){
        //Check if it is in the list
//        if let i = products.index(where: { $0.id.isEqual }) {
//            print("\(students[i]) starts with 'A'!")
//        }
        if let i = products.index(where: { (productInCart) -> Bool in
            productInCart.productId == product.id
        }){
            products[i].quantity += 1
        }else{
            products.append(InCartProduct(productId: product.id, product: product, singleCost: product.price, quantity: 1))
        }
        //remove a counter from the stock products
        
    }
    
}
