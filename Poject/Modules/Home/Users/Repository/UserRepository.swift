//
//  UserRepository.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

enum UserServiceEnum{
    case users
}

class UserRepository {
    
    var serviceType: UserServiceEnum = .users
    var httpClient =  HTTPClient()
    
    init(_ service: UserServiceEnum, _ client: URLSessionProtocol = URLSession.shared) {
        self.serviceType = service
        self.httpClient = HTTPClient(client)
    }
    
    func users(_ onResponse: @escaping ([UserModel]?) -> Void, _ onFailure: @escaping (String) -> Void){
        httpClient.request(request: self) { (response: Result<[UserModel]?, HTTPError>) in
            switch response{
                case .success(let response):
                    onResponse(response)
                case .failure(let error):
                    onFailure(error.localizedDescription)
            }
        }
    }
    
}
extension UserRepository: RequestProtocol{
    
    var baseURL: String {
        return Constants.Service.baseUrl
    }
    
    var httpMethod: HTTPMethod {
        return .GET
    }
    
    var httpBody: Data? {
        return nil
    }
    
    var path: String {
        return Constants.Service.posts
    }
    
    var queryParams: [String : String]? {
        return nil
    }
}

