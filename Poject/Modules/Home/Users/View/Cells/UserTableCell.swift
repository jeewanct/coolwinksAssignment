//
//  UserTableCell.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class UserTableCell: BaseTableCell {
    
    @IBOutlet weak var lblUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func update<T>(data: T) {
        let userData: UserModel = data as! UserModel
        lblUserName.text = "User\(userData.id)"
    }
}

extension UserTableCell{
    static let identifier = String(describing: UserTableCell.self)
}
