//
//  BaseCollectionCell.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell{
    
    override  func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update<T: Codable>(data: T){}
}
