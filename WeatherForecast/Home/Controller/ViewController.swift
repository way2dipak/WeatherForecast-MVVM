//
//  ViewController.swift
//  WeatherForecast
//
//  Created by DS on 27/04/20.
//  Copyright © 2020 developer.dipak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    
    var weatherDataSource: [WeatherViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.weatherTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerXIB()
    }
    
    func registerXIB() {
        weatherTableView.register(UINib(nibName: CityTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CityTableViewCell.identifier)
    }
    
    @IBAction func onTapAddButton(_ sender: UIBarButtonItem) {
        displayAlertWithTextField(title: "Add City", message: "", actionButtonName: "Add") { [weak self](text) in
            //self?.fetchWeather(cityName: text)
            self?.weatherDataSource.append(WeatherViewModel(name: text, details: nil))
        }
    }
    /*
    func fetchWeather(cityName: String) {
        HomeService().fetchWeather(withCity: cityName, unity: .imperial, result: { [weak self](details) in
            self?.weatherDataSource.append(details)
        }) { [weak self](error) in
            self?.displayAlertWithRetryAction(title: "Error", message: error, actionButtonName: "Retry", action: {
                self?.fetchWeather(cityName: cityName)
            })
        }
    }
 */
    
    @IBAction func onTapSettingButton(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: SettingViewController.identifier) as! SettingViewController
        navigationController?.pushViewController(vc, animated: true)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return self.tableView(tableView, weatherCellForRowAt: indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, weatherCellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier) as! CityTableViewCell
         let details = weatherDataSource[indexPath.row]
        cell.cityNameLabel.text = details.name.capitalized
        if details.weather != nil {
            cell.setValue(details: details)
        }
        else {
            details.fetchWeather(withCity: details.name, unity: .imperial, result: { [weak self] (weatherModel) in
                if let _ = self {
                    cell.setValue(details: weatherModel)
                }
            }) { [weak self](errorStr) in
                if let _ = self {
                    cell.displayCityNotAvailabel()
                    print("Error: \(errorStr)")
                }
            }
        }
        return cell
    }
}
