//
//  NSObject+Extension.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import Foundation

extension NSObject {
    
    // return Class Name
    public static var className: String {
        return String(describing: self)
    }
}
