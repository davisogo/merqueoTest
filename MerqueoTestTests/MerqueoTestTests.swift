//
//  MerqueoTestTests.swift
//  MerqueoTestTests
//
//  Created by John Edwin Guerrero Ayala on 3/26/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import XCTest
@testable import MerqueoTest

class MerqueoTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testConstantSingleton(){
        XCTAssertEqual(Constants.sharedInstance.productsUrl!, "http://dev.supermercap.com/api/dev/products")
    }
    
    func testPerformLoginAttempt(){
        let email = "prueba@prueba.com"
        let password = "prueba1234"
        UserSessionServices.sharedInstance.performLoginAttempt(email: email, password: password) { (jsonDictionary, error, loginResult)->() in
            XCTAssertEqual(loginResult, LoginErrorEnum.ReadyToGo)
        }
    }
    
    func testGetAllProducts(){
        ProductServices.sharedInstance.getAllProducts { (products, error) in
            
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
