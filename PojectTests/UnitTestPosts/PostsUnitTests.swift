//
//  PostsUnitTests.swift
//  PojectTests
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import Foundation

import XCTest
@testable import Poject

class UserPosts: XCTestCase{
    
    var viewModel: UserViewModel!
    var mockSession: MockSession!
    
    override func setUp() {
        viewModel = UserViewModel()
        mockSession = MockSession()
        
    }
    
    func testUsers(){
        let expectations = expectation(description: "Fetching Users")
        viewModel.reloadTable.bind { (value) in
            if value{
                expectations.fulfill()
            }
        }
        viewModel.users(mockSession)
        wait(for: [expectations], timeout: Constants.Service.timeInterval)
    }
    
    
}
