//
//  MockWeatherHelper.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 07/12/22.
//

import Foundation
import PromiseKit

class MockWeatherHelper : WeatherHelperProtocol{
    func fetchWeatherForecastDetails(latitude: Double, longitude: Double) -> Promise<WeatherInfo> {
        let (promise, resolver) = Promise<WeatherInfo>.pending()
        firstly {
            return Promise.value(WeatherInfo(main: Temperature(temp: 50), weather: [Weather(icon: "icon", description: "")], name: "Pune"))
        }.done {  location in
            resolver.fulfill(location)
        }
        return promise
      
    }
    
    func getIconFromServer(url: URL) -> Promise<UIImage> {
        return Promise.value(UIImage(named: "test.png")!)
    }
}

