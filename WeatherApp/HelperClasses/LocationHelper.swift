//
//  LocationHelper.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 27/11/22.
//

import UIKit
import PromiseKit


/// Use this method to get current location

class LocationHelper : LocationHelperProtocol {
    
    func getCurrentCordinates() -> Promise<CLLocationCoordinate2D> {
        let (promise, resolver) = Promise<CLLocationCoordinate2D>.pending()
        firstly {
            CLLocationManager.requestLocation()
        }.done {  location in
            resolver.fulfill((location.first?.coordinate)!)
        }
        return promise
    }
}
