//
//  UserChatViewModel.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

class UserChatViewModel: BaseViewModel {
    
    var userChats: [UserModel]?
    
    func createView(){
        reloadTable.value = true
    }
    
    
}
