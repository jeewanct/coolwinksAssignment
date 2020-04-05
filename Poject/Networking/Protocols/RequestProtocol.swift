//
//  RequestProtocol.swift
//  StarTalk
//
//  Created by jeevan tiwari on 11/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

protocol RequestProtocol {
    var baseURL: String { get }
    var path: String { get}
    var httpMethod: HTTPMethod { get }
    var httpBody: Data? { get }
    var queryParams: [String: String]? { get }
}
