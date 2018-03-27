//
//  ProductsPresenter.swift
//  MerqueoTest
//
//  Created by John Edwin Guerrero Ayala on 3/27/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import Foundation

struct ProductViewData{
    let id: Int
    let name: String
    let price: Int
    let stock : Int
    
    static func initWithProduct(product: Product) -> ProductViewData{
        return ProductViewData(id: product.id, name: product.name!, price: product.price, stock: product.stock)
    }
}

protocol ProductView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setProducts(_ products: [ProductViewData])
    func setEmptyProducts()
}

class ProductPresenter {
    fileprivate let productService:ProductServices
    weak fileprivate var productView : ProductView?
    
    init(productService:ProductServices){
        self.productService = productService
    }
    
    func attachView(_ view:ProductView){
        productView = view
    }
    
    func detachView() {
        productView = nil
    }
    
    func getProducts(){
        self.productView?.startLoading()
        productService.getAllProducts { [weak self] (products, error) in
            self?.productView?.finishLoading()
            if(products?.count == 0){
                self?.productView?.setEmptyProducts()
            }else{
                //                let mappedProducts = products.map({ (product) -> () in
                //                    return ProductViewData.initWithProduct(product: product)
                //                })
                var mappedProducts = [ProductViewData]()
                
                if let _products = products{
                    for product in _products{
                        mappedProducts.append(ProductViewData.initWithProduct(product: product))
                    }
                }
                
                self?.productView?.setProducts(mappedProducts)
            }
        }
        
    }
}
