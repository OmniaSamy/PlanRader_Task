//
//  LoaderProtocol.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import Foundation
import  UIKit

protocol LoaderProtocol {
    func showLoadingIndicator(view: UIView, type: LoaderType)
    func hideLoadingIndicator()
}

enum LoaderType {
    case custom, native
}
