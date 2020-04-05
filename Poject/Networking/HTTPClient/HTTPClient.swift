//
//  HTTPClient.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//
import Foundation

class HTTPClient{
    typealias HTTPResponse<T: Codable> = (Result<T, HTTPError>) -> Void
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
                    let jsonResponse = try JSONDecoder().decode(T.self, from: data ?? Data())
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
    
    func printResponse(_ data: Data?){
        let response = try? JSONSerialization.jsonObject(with: data ?? Data(), options: .mutableLeaves)
        Log.debug("\(String(describing: response))")
    }
    
    
}
