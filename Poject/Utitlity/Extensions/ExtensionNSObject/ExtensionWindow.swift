//
//  ExtensionWindow.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

extension NSObject{
    var appDelegate: AppDelegate?{
        UIApplication.shared.delegate as? AppDelegate
    }
}
