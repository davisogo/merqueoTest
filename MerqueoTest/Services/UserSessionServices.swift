//
//  UserSessionServices.swift
//  MerqueoTest
//
//  Created by John Edwin Guerrero Ayala on 3/26/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import Foundation
import Alamofire

class UserSessionServices {
    static var sharedInstance = UserSessionServices()
    
    func performLoginAttempt(email: String, password: String,completion: @escaping (_ status: Dictionary<String, Any>?, _ error: Error?, _ loginError: LoginErrorEnum?) -> ()){ //@escaping (Results<Product>) -> Void
        if let url = Constants.sharedInstance.loginUrl{
            let parameters: Parameters = [
                "email": email,
                "password": password
            ]
            Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON(completionHandler: { (response) in
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")                         // response serialization result
                
                switch response.result{
                case .success(let JSON):
                    let jsonDictionary = JSON as! Dictionary<String, Any>
                    if (jsonDictionary["status"] as! Int) == 1{
                        UserSession.sharedInstance.userEmail = email
                        UserSession.sharedInstance.userPassword = password
                        UserSession.sharedInstance.userToken = (jsonDictionary["token"] as! String)
                        completion(jsonDictionary, nil, LoginErrorEnum.ReadyToGo)
                    }else{
                        completion(jsonDictionary, nil, LoginErrorEnum.ErrorOnLogin)
                    }
                    break
                case .failure(let error):
                    completion(nil, error, LoginErrorEnum.ErrorOnRequest)
                    print("Request failed with error: \(error)")
                    break
                }
                
            })
        }
    }

}
