//
//  Loader.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import Foundation
import UIKit
//import SVProgressHUD

class Loader: NSObject {
    
    static var sharedViewSpinner: UIView?
    private static var onView = UIView()
    
    class func show (onView: UIView, type: LoaderType) {
        
        switch type {
        case .custom:
            print(" make any customization like use specific framework like SVProgressHUD")
//            SVProgressHUD.show()
        case .native:
            self.onView = onView
            if sharedViewSpinner != nil {
                sharedViewSpinner?.removeFromSuperview()
            }
            
            let spinnerView = UIView(frame: UIScreen.main.bounds)
            spinnerView.backgroundColor = .loaderBackgroundColor
            
            let viewBackgroundLoading: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.color = .green
            activityIndicator.startAnimating()
            activityIndicator.center = viewBackgroundLoading.center
            viewBackgroundLoading.addSubview(activityIndicator)
            
            viewBackgroundLoading.center = spinnerView.center
            viewBackgroundLoading.backgroundColor = UIColor.white
            viewBackgroundLoading.alpha = 1
            viewBackgroundLoading.clipsToBounds = true
            viewBackgroundLoading.layer.cornerRadius = 15
            
            spinnerView.addSubview(viewBackgroundLoading)
            onView.addSubview(spinnerView)
            
            sharedViewSpinner = spinnerView
        }
    }
    
    class func hide() {
        // native
        sharedViewSpinner?.removeFromSuperview()
        sharedViewSpinner = nil
    }
    
    class func hideCustomLoader() {
        // custom
//        SVProgressHUD.dismiss()
    }
}
