//
//  HomeService.swift
//  WeatherForecast
//
//  Created by DS on 28/04/20.
//  Copyright © 2020 developer.dipak. All rights reserved.
//

import Foundation

class HomeService {
    
    /*
     enum Unit: String {
        case metric = "metric"
        case imperial = "imperial"
    }
    
    func fetchWeather(withCity name: String, unity type: Unit, result: @escaping((WeatherViewModel)->()), error: @escaping((String)->())) {
        let urlStr = "https://api.openweathermap.org/data/2.5/weather?q=\(name.replacingOccurrences(of: "", with: "%20")),India&appid=3ffe5b777806a0cbbe3d9474e7aff7d3&units=\(type.rawValue)"
        NetworkManager.shared.httpRequestWith(link: urlStr, method: .GET, headers: [:], params: [:], model: WeatherModel.self, onSuccess: { (weather) in
            if weather.cod == 200 {
                let vwModel = WeatherViewModel(details: weather)
                result(vwModel)
            }
            else {
                error(weather.message)
            }
        }) { (errorString) in
            error(errorString)
        }
    }
 */
}
