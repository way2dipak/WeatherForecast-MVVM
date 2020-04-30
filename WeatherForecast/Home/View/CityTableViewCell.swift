//
//  CityTableViewCell.swift
//  WeatherForecast
//
//  Created by DS on 27/04/20.
//  Copyright © 2020 developer.dipak. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setValue(details: WeatherViewModel) {
        DispatchQueue.main.async {
            if details.weather != nil {
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
                self.tempLabel.text = details.weather?.convertToCelsius().formatAsDegree
            }
            else {
                self.spinner.isHidden = false
                self.spinner.startAnimating()
                self.tempLabel.text = ""
            }
        }
    }
    
    func displayCityNotAvailabel() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
            self.tempLabel.text = "-NA-"
        }
    }
    
}
