//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import Foundation

typealias BlockWithMessageAndBool = (String?, Bool) -> Void

protocol HomeViewModelProtocol: BaseViewModelProtocol {
    var citiesList: [String] { get }
}

class HomeViewModel: HomeViewModelProtocol {
    
    var citiesList: [String] = ["London", "Vienna", "Paris"]
    
    init() {
    }
}
