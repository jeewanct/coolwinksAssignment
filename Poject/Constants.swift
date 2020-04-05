//
//  Constants.swift
//  StarTalk
//
//  Created by jeevan tiwari on 11/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

struct Constants{
    static let SCREENBOUNDS = UIScreen.main.bounds
    static let SCREENWIDTH = SCREENBOUNDS.width
    static let SCREENHEIGHT = SCREENBOUNDS.height
    static let DEVICE_ID = UIDevice.current.identifierForVendor?.uuidString ?? ""
    static let APP_ID = "5"
    static let MOBILE_LENGTH = 10
    static let OTP_LENGTH = 6
    static let CHANNEL = "iOS"
    static let COUNTRY_CODE = "+91"
    static let OPERATOR = "Vodafone"
    static let OTP_TIMER_COUNT = 60
}
