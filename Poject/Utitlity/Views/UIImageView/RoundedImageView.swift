//
//  RoundedImageView.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView{
    
    @IBInspectable
    var cornerRadius: CGFloat = 4

    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
    }
}




