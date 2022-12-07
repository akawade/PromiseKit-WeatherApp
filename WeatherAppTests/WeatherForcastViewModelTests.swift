//
//  WeatherForcastViewModelTests.swift
//  WeatherAppTests
//
//  Created by Avinash Kawade on 07/12/22.
//




import XCTest
import PromiseKit

@testable import WeatherApp

class WeatherForcastViewModelTests: XCTestCase {
    var mockViewModel: WeatherForcastViewModel!
    
    override func setUp()  {
        super.setUp()
        mockViewModel = WeatherForcastViewModel(MockLocationHelper(),
                                             weatherVModel: MockWeatherHelper())
    }
    
    override func tearDown() {
          mockViewModel = nil
          super.tearDown()
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetWeatherForcastForLocation() {
   
        let expectation = XCTestExpectation(description: "getWeatherForcastForLocation")

            mockViewModel.getWeatherForcastForLocation().done { data in
            XCTAssert(data.name == "Pune",   "test passed")
            expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5.0)
    }
    
    func testGetWeatherIcon(){
        let expectation = XCTestExpectation(description: "getWeatherIconFrom")

           mockViewModel.getWeatherIconFrom(iconName:"test").done { data in
                // assert on the data
            XCTAssertNotNil(data, "")
                // fulfill the expectation
            expectation.fulfill()
            }
           wait(for: [expectation], timeout: 5.0)
    }
}
