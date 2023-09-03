//
//  WeatherViewModel.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/08/31.
//

import Foundation

class WeatherViewModel {
    
    var alerts: [Feature] = []
    var alertImages: [String:URL] = [:]
    
    func fetchAlerts(_ completion: @escaping () -> Void) {
        
        NetworkingManager.fetchWeatherAlerts { result in
            switch result {
            case .success(let alerts):
                self.alerts = alerts
                return completion()
            case .failure(let error):
                // Show error
                return completion()
            }
        }
    }
    
}
