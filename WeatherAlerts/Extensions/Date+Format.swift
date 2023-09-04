//
//  Date+Format.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/09/04.
//

import Foundation

extension Date {
    
    func formattedForDisplay() -> String {
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return outputDateFormatter.string(from: self)
    }
    
    func formatDurationToWords(from: Date) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropAll
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        
        return formatter.string(from: self.timeIntervalSince(from)) ?? "0 minutes"
    }
}
