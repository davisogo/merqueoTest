//
//  ProductServices.swift
//  MerqueoTest
//
//  Created by John Edwin Guerrero Ayala on 3/26/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import ObjectMapper
import AlamofireObjectMapper

class ProductServices{
    var productsArray = [Product]()
    static var sharedInstance = ProductServices()
    
    func removeAProductFromStock(product: Product){
        
    }
    
    func getAllProducts(completion: @escaping ([Product]?, Error?) -> ()){
        
        if(productsArray.count > 0){
            completion(self.productsArray, nil)
        }
        
        let headers: HTTPHeaders = [
            "Authorization": UserSession.sharedInstance.userToken,
            "Accept": "application/json"
        ]
        
        if let url = Constants.sharedInstance.productsUrl{
            Alamofire.request(url, headers: headers).responseArray(completionHandler: { [unowned self] (response: DataResponse<[Product]>) -> () in
                switch response.result{
                case .success:
                    let productArray = response.result.value
                    if let _productArray = productArray {
                        self.productsArray = _productArray
                        for product in _productArray {
                            if (product.name != nil){
                                print(product.name!)
                            }else{
                                print("Invalid parse")
                                break
                            }
                        }
                    }else{
                        print("Error downloading content")
                    }
                    completion(self.productsArray, nil)
                    break
                case .failure(let error):
                    print("Error loading: \(error)")
                    completion(nil, error)
                    break
                }
            })
        }
    }
}
