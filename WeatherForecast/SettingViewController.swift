//
//  SettingViewController.swift
//  WeatherForecast
//
//  Created by DS on 27/04/20.
//  Copyright © 2020 developer.dipak. All rights reserved.
//

import UIKit

protocol SettingDelegate {
    func selectedSetting()
}

class SettingViewController: UIViewController {
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}
