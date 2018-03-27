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
                let placeArray = response.result.value
                if let _placeArray = placeArray {
                    for place in _placeArray {
                        if (place.name != nil){
                            print(place.name!)
                            //                            print(place.photos!)
                        }else{
                            print("Invalid parse")
                            break
                        }
                    }
//                    self.updatePlacesDB(places: _placeArray)
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
