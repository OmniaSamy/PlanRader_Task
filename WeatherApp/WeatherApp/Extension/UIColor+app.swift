//
//  UIColor+app.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import UIKit

extension UIColor {
    
    class var loaderBackgroundColor: UIColor {
        guard let color = UIColor(named: "Loader Background Color") else {
            return UIColor()
        }
        return color
    }
}
