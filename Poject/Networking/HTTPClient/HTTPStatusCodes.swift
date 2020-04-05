//
//  HTTPStatusCodes.swift
//  StarTalk
//
//  Created by jeevan tiwari on 13/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

enum HTTPStatusCodes: Int, Codable{
    case tokenInvalid = 4002
    case success = 2000; // Success
    case noDataFound = 2004; // No data found
    case inProcess = 2005;
    case paramMissing = 4000; // Bad request / parameter
    case tokenExpired = 4001; // Token expire/Unauthorized
    case inactiveUserCode = 4003; // Inactive user
    case alreadyExist = 4009; // Conflict
    case notExist = 4010; // Conflict
    case exception = 5000; // The general catch-all error when
    case wrongRequestException = 0; // This  catch request error
    case badGateway = 5002; // bad gateway
    case serviceUnavailable = 5003; // Service Unavailable
    case actionNotConfigured = 5004; // Url for this action
    case readTimeOut = 5098; // Network read timeout
    case networkConnectTimeout = 5099; // Network connect
    case invalidFile = 5007; // Invalid file format
    case bmsSuccess = 200; // For bcms success
    case otpMismatch = 4011;
    case noRemainingCoins = 2010;
}
