//
//  WeatherHelper.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 27/11/22.
//

import Foundation
import PromiseKit



/// WeatherHelper class is used to get the weather detailsfor the cordinates.

class WeatherHelper: WeatherHelperProtocol {
    
    /// Use fetchWeatherForecastDetails method to get current location get the weather details for
    /// the cordinates from the open API backend system
    ///
    func fetchWeatherForecastDetails(latitude: Double, longitude: Double) -> Promise<WeatherInfo> {
        let urlString = "\(Constants.BaseURL)?lat=" +
            "\(latitude)&lon=\(longitude)&appid=\(Constants.APIKey)"
        let url = URL(string: urlString)!
        print("URL ---> \(url)")
        return firstly {
            URLSession.shared.dataTask(.promise, with: url)
        }.compactMap {
            
            print("Response --- \($0.data)")
            print(try JSONDecoder().decode(WeatherInfo.self, from: $0.data))
            return try JSONDecoder().decode(WeatherInfo.self, from: $0.data)
        }
    }
    
    /// Use getIconFromServer method to get Icom image from server. the icon name used is from the earlier
    /// information   retrieved  from the weather details .
    /// It calls the  open API for backend system
    ///
    func getIconFromServer(url: URL) -> Promise<UIImage> {
        return firstly {
            URLSession.shared.dataTask(.promise, with: url)
        }
        .then(on: DispatchQueue.global(qos: .background)) { urlResponse in
            return Promise.value(UIImage(data: urlResponse.data)!)
        }
    }
}
