//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Avinash Kawade on 27/11/22.
//

import XCTest
import PromiseKit

@testable import WeatherApp

class WeatherAppTests: XCTestCase {
    var weatherHelper: WeatherHelper!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    override func setUp() {
           super.setUp()
           self.weatherHelper = WeatherHelper()
       }

       override func tearDown() {
           super.tearDown()
           self.weatherHelper = nil
       }

    func testFetchWeatherForecastDetails() throws {
             firstly {
             self.weatherHelper.fetchWeatherForecastDetails(latitude: 0, longitude: 0)
             }.done(on: .global(qos: .background)) { data in
                XCTAssert(data.name == "Global",   "test passed")
             }.catch(on: .global(qos: .background)) { (error) in
                 XCTAssertNotNil(error)
             }
    }
    
    func testFetchWeatherForecastDetails_WithError() throws {
             firstly {
             self.weatherHelper.fetchWeatherForecastDetails(latitude: 0, longitude: 0)
             }.done(on: .global(qos: .background)) { data in
                XCTAssert(data.name == "Global",   "test passed")
             }.catch(on: .global(qos: .background)) { (error) in
                XCTAssertThrowsError( error)
             }
    }
    
    func testGetIconFromServer() throws {
             firstly {
             self.weatherHelper.getIconFromServer(url: URL.init(string: "url")!)
             }.done(on: .global(qos: .background)) { data in
                XCTAssertNotNil(data, "")
             }.catch(on: .global(qos: .background)) { (error) in
                 XCTAssertNotNil(error)
             }
    }
    
    func testGetIconFromServer_WithError() throws {
             firstly {
             self.weatherHelper.getIconFromServer(url: URL.init(string: "url")!)
             }.done(on: .global(qos: .background)) { data in
                XCTAssertNotNil(data, "")
             }.catch(on: .global(qos: .background)) { (error) in
                XCTAssertThrowsError(error)
             }
    }

}
