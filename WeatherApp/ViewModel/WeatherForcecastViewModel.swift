//
//  WeatherForcecastViewModel.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 27/11/22.
//

import Foundation
import PromiseKit
import CoreLocation

class WeatherForcastViewModel {
    
    private let locationVmodel: LocationHelperProtocol
    private let weatherVModel: WeatherHelperProtocol
    
    init(_locationVmodel : LocationHelperProtocol, weatherVModel: WeatherHelperProtocol){
        self.locationVmodel = _locationVmodel
        self.weatherVModel = weatherVModel
    }
    
    func getWeatherForcastForLocation() -> Promise<WeatherInfo> {
        let (promise, resolver) = Promise<WeatherInfo>.pending()
        
        firstly {
            locationVmodel.getCurrentCordinates()
            
        }.then { locationInfo in
            self.weatherVModel.fetchWeatherForecastDetails(latitude: Double(locationInfo.latitude ),
                                                           longitude: Double(locationInfo.longitude ))
        }.done {  weatherInfo in
            resolver.fulfill(weatherInfo)
            
        }.catch { [weak self] error in
            print(error.localizedDescription)
        }
        return promise
        
    }
    
    func getWeatherIconFrom(iconName: String) -> Promise<UIImage> {
        let urlString = Config.IconURL + "\(iconName).png"
        let url = URL(string: urlString)!
        return firstly {
            weatherVModel.getIconFromServer(url:url)
        }.then { image in
            return Promise.value(image)
        }
    }
}


