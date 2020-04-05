//
//  FlickrRepository.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

enum FlickrServiceEnum{
    case recentUploads
}

class FlickrRepository {
    
    var serviceType: FlickrServiceEnum = .recentUploads
    var httpClient =  HTTPClient()
    
    init(_ service: FlickrServiceEnum, _ client: URLSessionProtocol = URLSession.shared) {
        self.serviceType = service
        self.httpClient = HTTPClient(client)
    }
    
    func recentUploads(_ onResponse: @escaping ([Photo]?) -> Void, _ onFailure: @escaping (String) -> Void){
        httpClient.request(request: self) { (response: Result<FlickrModel, HTTPError>) in
            switch response{
                case .success(let response):
                    onResponse(response.photos.photo)
                case .failure(let error):
                    onFailure(error.localizedDescription)
            }
        }
    }
    
}
extension FlickrRepository: RequestProtocol{
    
    var baseURL: String {
        return Constants.Service.flickrBaseUrl
    }
    
    var httpMethod: HTTPMethod {
        return .GET
    }
    
    var httpBody: Data? {
        return nil
    }
    
    var path: String {
        return Constants.Service.recentUploads
    }
    
    var queryParams: [String : String]? {
        [
            "method"         : "flickr.photos.getRecent",
            "api_key"        : Constants.flickrAPIKey,
            "format"         : "json",
            "nojsoncallback" : "1"
            //"api_sig"        : Constants.apiSig
        ]
    }
}


