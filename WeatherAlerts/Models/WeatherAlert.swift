//
//  WeatherAlert.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/08/31.
//

import Foundation

// MARK: - WeatherAlert
struct WeatherAlert: Codable {
    let id: String?
    let properties: Properties?
}

// MARK: - Properties
struct Properties: Codable {
    let start, end: Date?
    let name, source: String?

    enum CodingKeys: String, CodingKey {
        case start = "effective"
        case end = "ends"
        case name = "event"
        case source = "senderName"
    }
}
