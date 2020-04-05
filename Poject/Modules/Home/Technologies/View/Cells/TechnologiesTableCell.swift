//
//  TechnologiesTableCell.swift
//  Poject
//
//  Created by jeevan tiwari on 05/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class TechnologiesTableCell: BaseTableCell {

    @IBOutlet weak var lblExpand: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    var technologyData: TechnologyModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func update<T>(data: T) {
        technologyData = data as? TechnologyModel
        setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        (superview as? BaseTableView)?.beginUpdates()
        setup()
        (superview as? BaseTableView)?.endUpdates()
    }
    
}

extension TechnologiesTableCell: CellSetup{
    func setup() {
        if isSelected{
            lblExpand.text  = "-"
            lblTitle.text   = technologyData.title
            lblMessage.text = technologyData.subTitle
        }else{
            lblExpand.text  = "+"
            lblTitle.text   = technologyData.title
            lblMessage.text = nil
        }
    }
}
