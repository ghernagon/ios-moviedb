//
//  DecoderMoviesTests.swift
//  DecoderMoviesTests
//
//  Created by Gerardo Hernández González on 29-04-20.
//  Copyright © 2020 Gerardo Hernández González. All rights reserved.
//

import XCTest
@testable import Movies

class DecoderMoviesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   func testFilmsDecoder() {
       let bundle = Bundle(for: type(of: self))
       guard let url = bundle.url(forResource: "Films", withExtension: "json") else {
           XCTFail("Missing file: Films.json")
           return
       }
       
       var films: Films
       var json: Data
       
       do {
           json = try Data(contentsOf: url)
           films = try JSONDecoder().decode(Films.self, from: json)
           XCTAssertNoThrow(films)
       } catch let DecodingError.dataCorrupted(context) {
           XCTFail("Data corrupted: \(context.debugDescription)")
       } catch let DecodingError.keyNotFound(key, context) {
           let message = "Key '\(key)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
           XCTFail(message)
       } catch let DecodingError.valueNotFound(value, context) {
           let message = "Value '\(value)' not found: \(context.debugDescription), codingPath: \(context.codingPath)"
           XCTFail(message)
       } catch let DecodingError.typeMismatch(type, context)  {
           let message = "Type '\(type)' mismatch: \(context.debugDescription), codingPath: \(context.codingPath)"
           XCTFail(message)
       } catch {
           XCTFail(error.localizedDescription)
       }
   }

}
