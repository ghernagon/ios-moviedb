//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Gerardo Hernández González on 29-04-20.
//  Copyright © 2020 Gerardo Hernández González. All rights reserved.
//

import XCTest
@testable import Movies

class MoviesTests: XCTestCase {
    
    var sut: FilmsTableViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = FilmsTableViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func testFetchPopular() {
        let e = expectation(description: "Alamofire")
        
        sut.fetchPopular { (isFinished: Bool) in
            if isFinished {
                debugPrint("Finished in unit test!!!")
                let expectedResult = 20
                XCTAssertEqual(self.sut.films?.all.count, expectedResult)
            }
            e.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
}
