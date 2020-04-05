//
//  TechnologiesViewModel.swift
//  Poject
//
//  Created by jeevan tiwari on 05/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

class TechnologiesViewModel: BaseViewModel{
    
    var technologies: [TechnologyModel]?
    
    func createView(){
        PlistData.shared.plist("TechnologyModel") { (data: [TechnologyModel]) in
            self.technologies = data
            self.reloadTable.value = true
        }
        
    }
}
