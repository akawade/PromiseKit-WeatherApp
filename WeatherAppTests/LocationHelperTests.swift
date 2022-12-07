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
             firstly {
                (locationModel?.getCurrentCordinates())!
             }.done(on: .global(qos: .background)) { data in
                XCTAssert(data.latitude == 0,   "test passed")
             }.catch(on: .global(qos: .background)) { (error) in
                 XCTAssertNotNil(error)
             }
    }
}
