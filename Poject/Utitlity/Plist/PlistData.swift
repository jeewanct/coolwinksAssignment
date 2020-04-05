//
//  PlistData.swift
//  Poject
//
//  Created by jeevan tiwari on 05/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

typealias PlistDictionary<T> = (T) -> Void
class PlistData{
    static let shared = PlistData()
    func plist<T: Codable>(_ name: String, completion: PlistDictionary<T>){
        if let path = Bundle.main.url(forResource: name, withExtension: "plist") {
            do{
                let data = try Data(contentsOf: path)
                let plistData = try PropertyListDecoder().decode(T.self, from: data)
                completion(plistData)
            }catch let error{
                Log.debug(error.localizedDescription)
            }
        }
    }
}
