//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import Foundation
import Moya

enum WeatherService {
    case getWeatherDetails(city: String)
}

extension WeatherService: TargetType {
    
    var baseURL: URL {
        return URL(string: NetworkManager.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getWeatherDetails:
            return "/data/2.5/weather" //?q=London
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWeatherDetails:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
            
        case .getWeatherDetails(let city):
            return .requestParameters(parameters: ["q": city], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
