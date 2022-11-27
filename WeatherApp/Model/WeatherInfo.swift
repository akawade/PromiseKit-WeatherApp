//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 27/11/22.
//

import Foundation

struct WeatherInfo: Codable {
    let main: Temperature
    let weather: [Weather]
    var name: String = "Error: Please verify your appID"
}

struct Weather: Codable {
    let icon: String
    let description: String
}

struct Temperature: Codable {
    let temp: Double
}
