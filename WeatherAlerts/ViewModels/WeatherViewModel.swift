//
//  WeatherViewModel.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/08/31.
//

import Foundation

class WeatherViewModel {
    
    var alerts: [WeatherAlert] = []
    
    func fetchAlerts(_ completion: @escaping () -> Void) {
        
        NetworkingManager.fetchWeatherAlerts { result in
            switch result {
            case .success(let alerts):
                self.alerts = alerts.filter{ $0.properties?.end != nil }
                return completion()
            case .failure(let error):
                AlertHelper.showAlert(message: error.localizedDescription)
                return completion()
            }
        }
    }
    
}
