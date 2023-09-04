//
//  WeatherAlertResponse.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/08/31.
//

import Foundation

// MARK: - WeatherAlertsResponse
struct WeatherAlertsResponse: Codable {
    let alerts: [WeatherAlert]?
    
    enum CodingKeys: String, CodingKey {
        case alerts = "features"
    }
}
