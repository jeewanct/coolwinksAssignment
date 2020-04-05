//
//  UserViewModel.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

class UserViewModel: BaseViewModel{

    var usersList:         [UserModel]?
    var selectedUser = "User"
    var userChats: Bindable<[UserModel]?> = Bindable(nil)
    private var repository: UserRepository!
    
    func users( _ client: URLSessionProtocol = URLSession.shared){
        repository = UserRepository(.users, client)
        showHUD.value = true
        repository.users({ [weak self](users) in
            self?.usersList = users
            self?.reloadTable.value = true
            self?.showHUD.value = false
        }) { [weak self](errorMessage) in
            self?.showHUD.value = false
        }
    }
    
    func selectedUser(_ item: Int){
        if let userID = usersList?[item].id{
            let chats = usersList?.filter({$0.userId == userID})
            selectedUser = "User" + String(userID)
            userChats.value = chats
        }
    }
}
