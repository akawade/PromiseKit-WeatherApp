//
//  ViewController.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 27/11/22.
//

import UIKit
import PromiseKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet private weak var cityName: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var weatherImageView: UIImageView!
    
    private var viewModel: WeatherForcastViewModel = WeatherForcastViewModel(_locationVmodel: LocationHelper(),
                                                                             weatherVModel: WeatherHelper())
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateWithCurrentLocation()
    }
    
    private func updateWithCurrentLocation() {
        showActivityIndicator()
        
        viewModel.getWeatherForcastForLocation()
            .then { [weak self] weatherInfo -> Promise<UIImage> in
                self?.updateDataToUI(with: weatherInfo)
                
                return self?.viewModel.getWeatherIconFrom(iconName: weatherInfo.weather.first!.icon)
                    ?? Promise(error: UIImage() as! Error)
            }.done(on: DispatchQueue.main) { imageIcon in
                self.dismissActivityIndicator()
                self.weatherImageView.image = imageIcon
            }
            .catch { [weak self] error in
                self?.dismissActivityIndicator()
                guard let self = self else { return }
                
                self.cityName.text = ""
                self.temperatureLabel.text = ""
                
                switch error {
                case is CLError where (error as? CLError)?.code == .denied:
                    ViewController.show(Constants.PermissionMsgKey, from: self)
                default:
                    ViewController.show(error.localizedDescription, from: self)
                }
            }
    }
    
    private func updateDataToUI(with weatherInfo: WeatherInfo) {
        let tempMeasurement = Measurement(value: weatherInfo.main.temp, unit: UnitTemperature.kelvin)
        let formatter = MeasurementFormatter()
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .none
        formatter.numberFormatter = numberFormatter
        let temp = formatter.string(from: tempMeasurement)
        self.temperatureLabel.text = temp
        self.cityName.text = weatherInfo.name
    }
}

