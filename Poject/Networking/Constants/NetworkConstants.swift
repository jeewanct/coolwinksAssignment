//
//  NetworkConstants.swift
//  StarTalk
//
//  Created by jeevan tiwari on 11/02/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

extension Constants{
    struct Service{
        static let baseUrl      = "http://1inamillion.in/"
        static let contentManager = "ContentManager/v1/"
        static let profilerSendOTP = "Profiler/v2/"
        static let profilerValidateOTP = "Profiler/v1/"
        static let timeInterval = 120.0
    }
}

extension Constants{
    struct ServicePath{
        static let sendOTP = "submitLoginOrSignUp"
        static let otp = "sendOtp"
        static let validateOTP = "validateOtpAndLogin"
        static let tutorials = "getBanners"
        static let guestUser = "guestLogin"
    }
}

extension Constants.ServicePath{
    static let fetchHomePage = "fetchHomePage"
    static let fetchMenu = "fetchMenu"
}

//MARK: My Chats
extension Constants.ServicePath{
    static let categories = "fetchCategories"
    static let multiWindowGames = "fetchViewAllForMultiWindowGames"
    static let singleWindowGames = "fetchViewAllForSingleWindowGames"
}

//MARK: My Profile
extension Constants.ServicePath{
    static let fetchAvatarOptions = "fetchAvatarOptions"
}

