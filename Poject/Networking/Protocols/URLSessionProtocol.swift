//
//  URLSessionProtocol.swift
//  StarTalk
//
//  Created by jeevan tiwari on 11/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}
