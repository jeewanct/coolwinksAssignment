//
//  BaseTableView.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class BaseTableView: UITableView{
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func registerCells(_ cells: UITableViewCell.Type...){
        cells.forEach { (cellName) in
            let identifier = String(describing: cellName.self)
            register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        }
    }
    
    func dequeueCell<T: UITableViewCell, U: Codable>(_ tableCell: T.Type, _ data: U) -> T {
        let cell = dequeueReusableCell(withIdentifier: String(describing: tableCell.self)) as! T
        if let unwrappedCell = cell as? BaseTableCell{
            unwrappedCell.update(data: data)
        }
        return cell
    }
}
