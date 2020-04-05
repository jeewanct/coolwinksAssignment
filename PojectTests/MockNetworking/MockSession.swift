//
//  MockSession.swift
//  PojectTests
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

@testable import Poject

class MockSession: URLSessionProtocol{
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        let mockData = MockRequest.getResults(url: request.url?.absoluteString)
        let mockResponse = URLResponse()
        completionHandler(mockData, mockResponse, nil)
        return MockDataTask()
    }
}
