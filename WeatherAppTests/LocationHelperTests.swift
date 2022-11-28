//
//  LocationHelperTests.swift
//  WeatherAppTests
//
//  Created by Avinash Kawade on 28/11/22.
//

import XCTest
@testable import WeatherApp
@testable import PromiseKit

class LocationHelperTests: XCTestCase {
    var locationModel: LocationHelper?
    
    override func setUp()  {
        super.setUp()
           locationModel = LocationHelper()
    }
    
    override func tearDown() {
          locationModel = nil
          super.tearDown()
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCurrentCordinates() throws {
//        let expectation = XCTestExpectation(description: "test getCordinate")
//             firstly {
//                (locationModel?.getCurrentCordinates())!
//             }.done(on: .global(qos: .background)) { (_) in
//                 XCTFail("test failed")
//             }.catch(on: .global(qos: .background)) { (error) in
//                 XCTAssertNotNil(error)
//                 expectation.fulfill()
//             }
//
//             wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
