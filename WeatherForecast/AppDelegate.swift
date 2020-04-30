//
//  AppDelegate.swift
//  WeatherForecast
//
//  Created by DS on 27/04/20.
//  Copyright © 2020 developer.dipak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setUpNavigationUI()
        
        
        return true
    }

    func setUpNavigationUI() {
        UINavigationBar.appearance().barTintColor = .white
        //UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    


}


