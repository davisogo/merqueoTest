//
//  LoginTextField.swift
//  MerqueoTest
//
//  Created by John Edwin Guerrero Ayala on 3/26/18.
//  Copyright © 2018 John Edwin Guerrero Ayala. All rights reserved.
//

import UIKit

@IBDesignable
class LoginTextField: UITextField {
    @IBInspectable var cornerRounding: CGFloat = 10 {
        didSet {
            layer.cornerRadius = cornerRounding
        }
    }
    @IBInspectable var customBorderColor: UIColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) {
        didSet {
            layer.borderColor = customBorderColor.cgColor
        }
    }
    @IBInspectable var customBorderWidth: CGFloat = 2.0{
        didSet {
            layer.borderWidth = customBorderWidth
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        applyStyles()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyles()
    }
    
    // MARK: - View
    override func awakeFromNib() {
        applyStyles()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        applyStyles()
    }
    
    func applyStyles(){
        self.layer.cornerRadius = cornerRounding
        self.layer.borderWidth = customBorderWidth
        self.layer.borderColor = customBorderColor.cgColor
    }
}
