//
//  HTTPHeaders.swift
//  StarTalk
//
//  Created by jeevan tiwari on 13/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

struct HTTPHeader{
    let headers = [
        "Deviceid": Constants.DEVICE_ID,
        "appid": Constants.APP_ID,
        "Content-type": "application/json",
        "Accept": "application/json",
        "operator" : Constants.OPERATOR,
        "Msisdn": UserDefaults.mobileNumber,
        "countryCode": "+91",
        "Access_token" : UserDefaults.accessToken,
        "channel": Constants.CHANNEL,
    ]
}

