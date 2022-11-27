//
//  WeatherHelper.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 27/11/22.
//

import Foundation
import PromiseKit

protocol WeatherHelperProtocol {
    func fetchWeatherForecastDetails(latitude: Double, longitude: Double) -> Promise<WeatherInfo>
    func getIconFromServer(url: URL) -> Promise<UIImage>
}
class WeatherHelper: WeatherHelperProtocol {
    
    func fetchWeatherForecastDetails(latitude: Double, longitude: Double) -> Promise<WeatherInfo> {
        let urlString = "\(Config.BaseURL)?lat=" +
            "\(latitude)&lon=\(longitude)&appid=\(Config.APIKey)"
        let url = URL(string: urlString)!
        
        return firstly {
            URLSession.shared.dataTask(.promise, with: url)
        }.compactMap {
            return try JSONDecoder().decode(WeatherInfo.self, from: $0.data)
        }
    }
    
    func getIconFromServer(url: URL) -> Promise<UIImage> {
        return firstly {
            URLSession.shared.dataTask(.promise, with: url)
        }
        .then(on: DispatchQueue.global(qos: .background)) { urlResponse in
            return Promise.value(UIImage(data: urlResponse.data)!)
        }
    }
}
