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

func getAllProducts(completion: @escaping () -> ()){ //@escaping (Results<Place>) -> Void
    if let url = Constants.sharedInstance.productsUrl{
        Alamofire.request(url).responseArray(completionHandler: { (response: DataResponse<[Product]>) -> () in
            switch response.result{
            case .success:
                let productArray = response.result.value
                if let _productArray = productArray {
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
                completion()
                break
            case .failure(let error):
                print("Error loading: \(error)")
                break
            }
        })
    }
}
