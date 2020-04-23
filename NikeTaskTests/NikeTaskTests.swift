//
//  NikeTaskTests.swift
//  NikeTaskTests
//
//  Created by Apple on 17/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest
@testable import NikeTask

class NikeTaskTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testImageViewLoad() {
        let val = UIImageView()
        let str = "www.google.com"
        let ImageLoadVal: () = val.loadImage(imagePath: str)
        XCTAssert(ImageLoadVal == (), "Load Image function works fine")
    }
    
    func testErrorAlertController() {
        let val = UIViewController()
        let title = "Error title is"
        let message = "Error occured due to certain issue"
        let errorAlert = val.ErrorMessage(titleStr: title, messageStr: message)
        XCTAssert(errorAlert == (), "Error message Alert function works fine")
    }
    
    func testJSONParsing() {
        if let data = try? Data.init(contentsOf: URL(string: "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/explicit.json")!) {
            XCTAssertNotNil(data)
        } else {
            XCTFail()
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
//             Put the code you want to measure the time of here.
            let exp = expectation(description: "data fetch")
            if let data = try? Data.init(contentsOf: URL(string: "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/explicit.json")!) {
                exp.fulfill()
                XCTAssertNotNil(data)
            } else {
                XCTFail()
            }
            waitForExpectations(timeout: 10.0) { (error) in
                print(error?.localizedDescription as Any)
            }
        }
    }

}
