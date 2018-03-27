//
//  Session.swift
//  MerqueoTest
//
//  Created by John Edwin Guerrero Ayala on 3/26/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import Foundation

class UserSession {
    var userEmail = String()
    var userPassword = String()
    var userToken = String()
    
    static var sharedInstance = UserSession()
    
    func emptyUserSession(){
        self.userEmail = String()
        self.userPassword = String()
        self.userToken = String()
    }
}
