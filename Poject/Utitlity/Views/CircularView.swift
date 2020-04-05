//
//  CircularView.swift
//  StarTalk
//
//  Created by jeevan tiwari on 13/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

@IBDesignable
class CircularView: UIView{
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
