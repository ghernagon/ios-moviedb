//
//  DetailMoviesTests.swift
//  DetailMoviesTests
//
//  Created by Gerardo Hernández González on 29-04-20.
//  Copyright © 2020 Gerardo Hernández González. All rights reserved.
//

import XCTest
@testable import Movies

class DetailMoviesTests: XCTestCase {

    var sut: DetailViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "Films", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nc = storyboard.instantiateInitialViewController() as! UINavigationController
        sut = storyboard.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        nc.pushViewController(sut, animated: false)
        
        if (data != nil) {
            let films = try? JSONDecoder().decode(Films.self, from: data!)
            sut.selectedFilm = films?.all[0]
        }
        
        let _ = sut.view
        sut.viewWillAppear(true)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testFetchCoverImage() {
        let e = expectation(description: "Alamofire")
        
        sut.fetchCoverImageFrom("/5BwqwxMEjeFtdknRV792Svo0K1v.jpg") { (isFinished: Bool) in
            if isFinished {
                debugPrint("Finished in unit test!!!")
                let unexpectedResult = UIImage(named: "placeholder", in: Bundle(for: DetailViewController.self), compatibleWith: nil)
                XCTAssertNotEqual(self.sut.coverImage.image, unexpectedResult)
            }
            e.fulfill()
            XCTAssertTrue(isFinished, "Expected to finish without errors")
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testFailFetchCoverImage() {
        let e = expectation(description: "Alamofire")
        
        sut.fetchCoverImageFrom("/67asdasd9a0snd.jpg") { (isFinished: Bool) in
            debugPrint("Finished in unit test!!!")
            let expectedResult = UIImage(named: "placeholder", in: Bundle(for: DetailViewController.self), compatibleWith: nil)
            XCTAssertEqual(self.sut.coverImage.image, expectedResult)
            XCTAssertFalse(isFinished, "Expected to not finish")
            e.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
}
