//
//  FilmsTests.swift
//  FilmsTests
//
//  Created by Gerardo Hernández González on 29-04-20.
//  Copyright © 2020 Gerardo Hernández González. All rights reserved.
//

import XCTest
@testable import Movies

class FilmsTests: XCTestCase {

    var sut: FilmsManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = FilmsManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testFetchPopular() {
        let e = expectation(description: "Alamofire")
        
        sut.fetchPopular()
    }

}
