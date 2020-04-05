//
//  FlickrModel.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

struct FlickrModel: Codable {
    let photos: Photos
    let stat: String
}

struct Photos: Codable {
    let page, pages, perpage, total: Int
    let photo: [Photo]
}

struct Photo: Codable {
    let id, owner, secret: String
    let server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
}

////enum Server: String, Codable {
//    case the65535 = "65535"
//}
