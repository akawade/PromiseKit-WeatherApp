//
//  Constants.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 27/11/22.
//

import Foundation

struct Constants {
    static let APIKey = "71274958d99855d4efc83eda8e6e2b42"
    static let BaseURL = "https://api.openweathermap.org/data/2.5/weather"
    static let IconURL = "http://openweathermap.org/img/w/"
    static var PermissionMsgKey = "Please grant location permissions in Settings"
    static var weatherForecastDetailURL = "\(Constants.BaseURL)?lat=%s&lon=%s&appid=\(Constants.APIKey)"

}
