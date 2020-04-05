//
//  BaseTableCell.swift
//  OneGames
//
//  Created by jeevan tiwari on 23/03/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class BaseTableCell: UITableViewCell{
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func update<T: Codable>(data: T){}
}
