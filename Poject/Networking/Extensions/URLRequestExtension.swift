//
//  URLRequestExtension.swift
//  StarTalk
//
//  Created by jeevan tiwari on 11/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

extension RequestProtocol{
    var request: URLRequest{
        
       // let url = baseUrl.appendingPathComponent(path)
        let url = baseURL + path
        guard var urlComponent = URLComponents(string: url) else {
            fatalError("Unable to create url component")
        }
        var queryItem = [URLQueryItem]()
        for (key, value) in queryParams ?? [String: String](){
            queryItem.append(URLQueryItem(name: key, value: String(describing: value)))
        }
        urlComponent.queryItems = queryItem
        
        var urlRequest =
            URLRequest(url: urlComponent.url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: Constants.Service.timeInterval)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.httpBody = httpBody
        urlRequest.allHTTPHeaderFields = HTTPHeader().headers
        return urlRequest
    }
}
