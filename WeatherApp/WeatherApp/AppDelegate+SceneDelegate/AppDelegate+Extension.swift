//
//  AppDelegate+Extension.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import Foundation

extension AppDelegate {
    
    func initNetwork() {
        let defaults = NetworkDefaults(baseUrl: "https://openweathermap.org",
                                       apiKey: "f5cb0b965ea1564c50c6f1b74534d823")
        NetworkManager.shared = NetworkManager(config: defaults)
    }
}
