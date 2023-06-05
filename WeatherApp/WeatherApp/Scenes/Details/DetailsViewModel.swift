//
//  DetailsViewModel.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import Foundation

protocol DetailsViewModelProtocol: BaseViewModelProtocol {
    func getCityWeatherDetails(completion: @escaping BlockWithMessageAndBool)
    var selectedCity: String? { set get }
    var cityWeatherDetails: WeatherModel? { set get }
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    var selectedCity: String?
    var cityWeatherDetails: WeatherModel?
    
    init(selectedCity: String) {
        self.selectedCity = selectedCity
    }
    
    func getCityWeatherDetails(completion: @escaping BlockWithMessageAndBool) {
        
        NetworkManager.shared
            .getWeatherDetails(city: selectedCity ?? "",
                             completion: {[weak self] (result: Result<WeatherModel, NetworkError>, _) in
                
                switch result {
                case .success(let data):
                    print("data \(data)")
                    
                    self?.cityWeatherDetails = data
                    completion("sucess", true)
                case .failure(let error):
                    print("error \(error)")
                    completion(error.errorMessage(), false)
                }
            })
    }
}
