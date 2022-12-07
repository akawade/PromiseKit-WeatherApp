//
//  MockLocationHelper.swift
//  WeatherAppTests
//
//  Created by Avinash Kawade on 07/12/22.
//

import Foundation
import PromiseKit

class MockLocationHelper : LocationHelperProtocol {
    @discardableResult func getCurrentCordinates() -> Promise<CLLocationCoordinate2D> {
        let (promise, resolver) = Promise<CLLocationCoordinate2D>.pending()
        firstly {
            return Promise.value(CLLocationCoordinate2D(latitude: 0, longitude: 0))
        }.done {  location in
            resolver.fulfill(location)
        }
        return promise
    }
}
