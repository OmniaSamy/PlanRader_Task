//
//  DetailsViewController.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import UIKit

class DetailsViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var descriptionValueLabel: UILabel!
    @IBOutlet private weak var tempValueLabel: UILabel!
    @IBOutlet private weak var humidtyValueLabel: UILabel!
    @IBOutlet private weak var windSpeedValueLabel: UILabel!
    
    var viewModel: DetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpScreenDesign()
        getWeatherDetails()
    }

    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private
extension DetailsViewController {
   
    private func setUpScreenDesign() {
        self.title = viewModel?.selectedCity
    }
    
    private func getWeatherDetails() {
//        self.showLoadingIndicator(view: self.view, type: .custom)
        viewModel?.getCityWeatherDetails(completion: {[weak self] (msg, success) in
            guard let self = self else { return }
//            self.hideLoadingIndicator()
            
            if success {
                self.bindWeatherData()
            } else {
                self.showErrorMessage(errorMessage: msg ?? "")
            }
        })
    }
    
    private func bindWeatherData() {
        
        guard let weatherData = viewModel?.cityWeatherDetails else { return }
        descriptionValueLabel.text = weatherData.description
        tempValueLabel.text = weatherData.temp
        humidtyValueLabel.text = weatherData.humidty
        windSpeedValueLabel.text = weatherData.windSpeed
    }
}
