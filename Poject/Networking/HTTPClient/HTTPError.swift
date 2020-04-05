//
//  HTTPError.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

struct HTTPError: Error{
    var localizedDescription: String?
    init(_ description: String? = "Something went wrong") {
        localizedDescription = description
    }
}
