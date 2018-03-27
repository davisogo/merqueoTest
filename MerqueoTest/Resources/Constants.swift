//
//  Constants.swift
//  MerqueoTest
//
//  Created by John Edwin Guerrero Ayala on 3/26/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import Foundation

class Constants{
    var baseUrl:String?
    var plistDict:Dictionary<String, Any>?
    
    private var loginRoute: String?
    var loginUrl: String? {
        get{
            return self.baseUrl! + loginRoute!
        }
    }
    
    private var productsRoute: String?
    var productsUrl: String? {
        get{
            return self.baseUrl! + productsRoute!
        }
    }
    
    static var sharedInstance = Constants()
    
    private init(){
        initWithPlist()
    }
    
    private func initWithPlist(){
        if let path = Bundle.main.path(forResource: "ConstantsPropertyList", ofType: "plist") {
            let tempDict = NSDictionary(contentsOfFile: path)
            self.plistDict = tempDict as? Dictionary<String, Any>;
            self.baseUrl = tempDict?.object(forKey: "baseUrl") as? String
            self.loginRoute = tempDict?.object(forKey: "LoginUrl") as? String
            self.productsRoute = tempDict?.object(forKey: "productsUrl") as? String
        }
    }
    
}
