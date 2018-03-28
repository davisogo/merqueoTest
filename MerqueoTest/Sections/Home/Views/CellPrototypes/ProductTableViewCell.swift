//
//  ProductTableViewCell.swift
//  MerqueoTest
//
//  Created by John Edwin Guerrero Ayala on 3/27/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet var productName: UILabel!
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var productStock: UILabel!
    weak var delegate: CellBehaviourDelegate?
    var product: ProductViewData!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRowData(productViewData: ProductViewData, delegate: CellBehaviourDelegate){
        self.delegate = delegate
        product = productViewData
        productName.text = product.name
        productPrice.text = "$ \(product.price)"
        productStock.text = "\(product.stock)"
    }
    
    @IBAction func onBuyButtonTap(_ sender: Any) {
        if let _delegate = delegate {
            _delegate.onAddToCartTapped(productData: product)
        }
    }
}
