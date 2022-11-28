//
//  WeatherForcecastViewModel.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 27/11/22.
//

import Foundation
import PromiseKit
import CoreLocation

/// Use WeatherForcastViewModel method to have the business logic for View
/// It calls the  correspondind API for Helper classes
///
class WeatherForcastViewModel {
    
    private let locationVmodel: LocationHelperProtocol
    private let weatherVModel: WeatherHelperProtocol
    
    init(_locationVmodel : LocationHelperProtocol, weatherVModel: WeatherHelperProtocol){
        self.locationVmodel = _locationVmodel
        self.weatherVModel = weatherVModel
    }
    
    /// Use getWeatherForcastForLocation method to call weather forcast details
    /// calls the  corresponding API from Helper classes
    ///
    func getWeatherForcastForLocation() -> Promise<WeatherInfo> {
        let (promise, resolver) = Promise<WeatherInfo>.pending()
        
        firstly {
            locationVmodel.getCurrentCordinates()
            
        }.then { locationInfo in
            self.weatherVModel.fetchWeatherForecastDetails(latitude: Double(locationInfo.latitude ),
                                                           longitude: Double(locationInfo.longitude ))
        }.done {  weatherInfo in
            resolver.fulfill(weatherInfo)
            
        }.catch { error in
            print(error.localizedDescription)
        }
        return promise
        
    }
    
    /// Use getWeatherIconFrom method to call weather forcast mage for respective weather info
    /// calls the  corresponding API from Helper classes
    ///
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


