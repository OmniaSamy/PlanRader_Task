//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import Foundation

#warning("i was trying to run api but always return 401 so i expected the response")

struct WeatherModel: Codable {
    
    var description: String?
    var temp: String?
    var humidty: String?
    var windSpeed: String?
    
    enum CodingKeys: String, CodingKey {
        
        case description = "description"
        case temp = "temp"
        case humidty = "humidty"
        case windSpeed = "windSpeed"
    }
}
