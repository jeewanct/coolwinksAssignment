//
//  URLResponseExtensions.swift
//  StarTalk
//
//  Created by jeevan tiwari on 19/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

extension Encodable{
    var data: Data?{
        try? JSONEncoder().encode(self)
    }
}

extension Data{
    func decode<T: Codable>() -> T?{
        try? JSONDecoder().decode(T.self, from: self)
    }
}
