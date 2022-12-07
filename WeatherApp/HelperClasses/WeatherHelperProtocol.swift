//
//  WeatherHelperProtocol.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 07/12/22.
//

import Foundation
import PromiseKit

protocol WeatherHelperProtocol {
    func fetchWeatherForecastDetails(latitude: Double, longitude: Double) -> Promise<WeatherInfo>
    func getIconFromServer(url: URL) -> Promise<UIImage>
}
