//
//  HTTPClient.swift
//  StarTalk
//
//  Created by jeevan tiwari on 11/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

class HTTPClient{
    typealias HTTPResponse<T: Codable> = (Result<BaseResponseModel<T>, HTTPError>) -> Void
    private var shared: URLSessionProtocol = URLSession.shared
    
    init(_ sessionProtocol: URLSessionProtocol = URLSession.shared) {
       shared = sessionProtocol
    }
    
    func request<T: Codable>(request: RequestProtocol, completion: @escaping HTTPResponse<T>){
        let performRequest = request.request
        shared.dataTask(with: performRequest) { (data, response, error) in
            Log.debug("\(String(describing: request.request.url))")
            if let unwrappedError = error{
                let httpError = HTTPError(unwrappedError.localizedDescription)
                DispatchQueue.main.async {
                    completion(.failure(httpError))
                }
            }
            if let _ = response {
                do{
                    let jsonResponse = try JSONDecoder().decode(BaseResponseModel<T>.self, from: data ?? Data())
                    try self.parse(jsonResponse.code, jsonResponse.msg)
                    self.printResponse(data)
                    DispatchQueue.main.async {
                        completion(.success(jsonResponse))
                    }
                }catch let error{
                    Log.debug("\(String(describing: error))")
                    var httpError: HTTPError
                    if error is HTTPError{
                        httpError = error as! HTTPError
                    }else{
                        httpError = HTTPError(error.localizedDescription)
                    }
                    DispatchQueue.main.async {
                        completion(.failure(httpError))
                    }
                }
            }else{
                // let httpError = HTTPError(error.localizedDescription)
            }
        }.resume()
    }
    
    func parse(_ statusCode: Int?, _ message: String?) throws{
        guard let httpStatusCode = HTTPStatusCodes(rawValue: statusCode!) else { throw HTTPError()}
        switch httpStatusCode {
            case .success:
                break
            case .tokenInvalid, .tokenExpired:
                UserInformation.shared.logout()
            default:
                throw HTTPError(message)
        }
    }
    
    func printResponse(_ data: Data?){
        let response = try? JSONSerialization.jsonObject(with: data ?? Data(), options: .mutableLeaves)
        Log.debug("\(String(describing: response))")
    }
    
    
}
