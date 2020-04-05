//
//  FlickrRecentUnitTest.swift
//  PojectTests
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import XCTest

@testable import Poject

class FlickrRecentUnitTest: XCTestCase{
    
    var viewModel :  FlickrViewModel!
    var mockSession: MockSession!
    
    override func setUp() {
        viewModel  = FlickrViewModel()
        mockSession = MockSession()
    }
    
    func testRecentUploads(){
        let expectations = expectation(description: "Fetch Flickr Recent uploads")
        viewModel.reloadTable.bind { (value) in
            if value{
                expectations.fulfill()
            }
        }
        viewModel.images(mockSession)
        wait(for: [expectations], timeout: Constants.Service.timeInterval)
    }
    
}
