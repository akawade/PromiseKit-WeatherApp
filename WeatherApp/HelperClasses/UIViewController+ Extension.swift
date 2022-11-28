//
//  Utility.swift
//  WeatherApp
//
//  Created by Avinash Kawade on 27/11/22.
//

import Foundation
import UIKit
import PromiseKit

extension UIViewController {
    
    /// Use showActivityIndicator method to show activityIndicator while loading
    ///
   
    func showActivityIndicator() {
        let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityView.startAnimating()
        activityView.color = UIColor.darkGray
        activityView.tag = 400
        activityView.center = view.center
        self.view.addSubview(activityView)
    }
    
    /// Use dismissActivityIndicator method to stop activityIndicator after loading
    ///
    func dismissActivityIndicator() {
        if let subViews = self.view.viewWithTag(400) {
            subViews.removeFromSuperview()
        }
    }
    
    class func show(_ message: String, from controller: UIViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        controller.show(alert, sender: nil)
    }
}
