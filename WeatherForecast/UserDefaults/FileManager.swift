//
//  FileManager.swift
//  WeatherForecast
//
//  Created by DS on 30/04/20.
//  Copyright © 2020 developer.dipak. All rights reserved.
//

import Foundation
import UIKit

class FileManager {
    
    static let shared = FileManager()
    
    private init() {}
    
    func saveObjectToUserDefaults<T : Codable>(object: T.Type) {
        
    }
    
    func retriveObjectFromUserDefaults<T : Codable>() -> T.Type {
        return T.Type.self as! T.Type
    }
    
    
}
