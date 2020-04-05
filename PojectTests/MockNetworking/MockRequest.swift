//
//  MockRequest.swift
//  PojectTests
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

@testable import Poject

enum MockRequestEnum: String{
    case posts
    case flickr
    
    
    static subscript(string: String ) -> MockRequestEnum{
        if string.contains(posts.rawValue){
            return .posts
        }else if string.contains(flickr.rawValue){
            return .flickr
        }else{
            return .flickr
        }
    }
}

class MockRequest{
    static func getResults(url: String?) -> Data?{
        guard let url = url else { return nil }
        let request =  MockRequestEnum[url]
        let filePath =  Bundle.init(for: MockSession.self).url(forResource: request.rawValue, withExtension: "json")!
        return try? Data(contentsOf: filePath)
    }
}
