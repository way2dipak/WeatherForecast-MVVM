//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by DS on 28/04/20.
//  Copyright © 2020 developer.dipak. All rights reserved.
//

import Foundation


struct WeatherModel: Codable {
    var timeZone: Int
    var id: Int
    var name: String
    var cod: Int
    var message: String
    var main: MainModel
    
    enum CodingKeys: String, CodingKey {
        case timeZone = "timezone"
        case id
        case name
        case cod
        case message
        case main
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.timeZone = try values.decodeIfPresent(Int.self, forKey: .timeZone) ?? 0
        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.cod  = try values.decodeIfPresent(Int.self, forKey: .cod) ?? 0
        self.message  = try values.decodeIfPresent(String.self, forKey: .message) ?? ""
        self.main = try values.decodeIfPresent(MainModel.self, forKey: .main) ?? MainModel(from: decoder)
    }
}

struct MainModel: Codable {
    var temp: Double
    var feelsLike: Double
    var maxTemp: Double
    var minTemp: Double
    var pressure: Double
    var humidity: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
        case pressure
        case humidity
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.temp = try values.decodeIfPresent(Double.self, forKey: .temp) ?? 0.0
        self.feelsLike = try values.decodeIfPresent(Double.self, forKey: .feelsLike) ?? 0.0
        self.minTemp = try values.decodeIfPresent(Double.self, forKey: .minTemp) ?? 0.0
        self.maxTemp  = try values.decodeIfPresent(Double.self, forKey: .maxTemp) ?? 0.0
        self.pressure = try values.decodeIfPresent(Double.self, forKey: .pressure) ?? 0.0
        self.humidity = try values.decodeIfPresent(Double.self, forKey: .humidity) ?? 0.0
    }
    
    func convertToCelsius() -> Double {
        return (temp - 32) * 5/9
    }
}
