//
//  ViewController.swift
//  MerqueoTest
//
//  Created by John Edwin Guerrero Ayala on 3/26/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import UIKit

protocol CellBehaviourDelegate: class {
    func onAddToCartTapped(productData: ProductViewData)
}

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    fileprivate let productPresenter = ProductPresenter(productService: ProductServices())
    fileprivate var productsToDisplay = [ProductViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpTableView()
        
        activityIndicator?.hidesWhenStopped = true
        
        productPresenter.attachView(self)
        
        productPresenter.getProducts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: CellBehaviourDelegate{
    func onAddToCartTapped(productData: ProductViewData) {
        //Add to cart singleton
        print("My id was tapped: \(productData.id)")
    }
}



extension ViewController: ProductView{
    func startLoading() {
        activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator?.stopAnimating()
    }
    
    func setProducts(_ products: [ProductViewData]) {
        productsToDisplay = products
        tableView?.isHidden = false
        emptyView?.isHidden = true;
        tableView?.reloadData()
    }
    
    func setEmptyProducts() {
        tableView?.isHidden = true
        emptyView?.isHidden = false;
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setUpTableView(){
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell)
        cell.setRowData(productViewData: productsToDisplay[indexPath.row], delegate: self)
        return cell
    }
    
}

