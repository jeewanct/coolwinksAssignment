//
//  BaseViewModel.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

class BaseViewModel{
    var reloadTable:       Bindable<Bool> = Bindable(false)
    var activityIndicator: Bindable<Bool> = Bindable(false)
    var showHUD:           Bindable<Bool> = Bindable(false)
}
