//
//  UserChatTableCell.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class UserChatTableCell: BaseTableCell {
    
    @IBOutlet weak var lblExpand: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    
    var userData: UserModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func update<T>(data: T) {
        userData = data as? UserModel
        setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        (superview as? BaseTableView)?.beginUpdates()
        setup()
        (superview as? BaseTableView)?.endUpdates()
    }
}
extension UserChatTableCell: CellSetup{
    func setup() {
        if isSelected{
            lblExpand.text  = "-"
            lblTitle.text   = userData.title
            lblMessage.text = userData.body
        }else{
            lblExpand.text  = "+"
            lblTitle.text   = userData.title
            lblMessage.text = nil
        }
    }
}

extension UserChatTableCell{
    static let identifier = String(describing: UserChatTableCell.self)
}
