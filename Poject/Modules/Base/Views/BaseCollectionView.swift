//
//  BaseCollectionView.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView{
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func registerCells(_ cells: UICollectionViewCell.Type...){
        cells.forEach { (cellName) in
            let identifier = String(describing: cellName)
            register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        }
    }
    
    func dequeueCell<T: UICollectionViewCell, U: Codable>(_ indexPath: IndexPath,_ collectionCell: T.Type, _ data: U) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: String(describing: collectionCell.self), for: indexPath) as! T
        if let unwrappedCell = cell as? BaseCollectionCell{
            unwrappedCell.update(data: data)
        }
        return cell
    }
    
}

