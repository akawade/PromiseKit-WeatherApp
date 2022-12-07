//
//  LocationHelperProtocol.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 07/12/22.
//

import Foundation
import PromiseKit

/// LocationHelper class helps get the location cordinates of the device.
///
protocol LocationHelperProtocol {
    func getCurrentCordinates() -> Promise<CLLocationCoordinate2D>
}

