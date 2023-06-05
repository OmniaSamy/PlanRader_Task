//
//  CitiesTableViewCell.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(city: String) {
        cityNameLabel.text = city
    }
}
