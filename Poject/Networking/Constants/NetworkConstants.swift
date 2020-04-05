//
//  NetworkConstants.swift
//  StarTalk
//
//  Created by jeevan tiwari on 11/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

extension Constants{
    struct Service{
        static let baseUrl      = "http://jsonplaceholder.typicode.com/"
        static let flickrBaseUrl = "https://www.flickr.com/"
        static let imageBaseURL = "https://farm1.staticflickr.com/"
        static let timeInterval = 120.0
    }
}

extension Constants.Service{
    static let posts = "posts"
    static let recentUploads = "services/rest/"
}
