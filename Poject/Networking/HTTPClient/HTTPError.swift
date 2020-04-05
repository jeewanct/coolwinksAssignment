//
//  HTTPError.swift
//  StarTalk
//
//  Created by jeevan tiwari on 11/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

struct HTTPError: Error{
    var localizedDescription: String?
    init(_ description: String? = "Something went wrong") {
        localizedDescription = description
    }
}
