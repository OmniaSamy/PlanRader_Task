//
//  NetworkManager+Weather.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getWeatherDetails(city: String,
                           completion: @escaping(_ result: Swift.Result<WeatherModel, NetworkError>,
                                                 _ statusCode: Int?) -> Void) {
        provider.request(MultiTarget(WeatherService.getWeatherDetails(city: city))) {result in
            self.parseResponse(moyaResult: result, completion: completion)
        }
    }
}
