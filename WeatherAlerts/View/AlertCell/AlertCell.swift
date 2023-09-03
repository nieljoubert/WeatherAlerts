//
//  AlertCell.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/08/31.
//

import UIKit
import SDWebImage

class AlertCell: UITableViewCell {
    
    @IBOutlet weak var alertImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var startLabel: UILabel!
    @IBOutlet private weak var endLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var sourceLabel: UILabel!
        
    // wanted to use inout for alertImages, but has an issue if AlertCell is a class and cant make it a struct
    func setValues(for weatherAlert: Feature?, at row: Int, alertImages: [String:URL], _ completion: @escaping ([String:URL]) -> Void) {
        guard let alert = weatherAlert, let end = alert.properties?.ends else {
            completion(alertImages)
            return
        }
        
        var modifiedAlertImages = alertImages
        
//        nameLabel.text = alert?.properties?.name
//        startLabel.text = alert?.properties?.start?.debugDescription
//        endLabel.text = alert?.properties?.end?.debugDescription
//        durationLabel.text = alert?.properties?.duration?.debugDescription
//        sourceLabel.text = alert?.properties?.source
        
        nameLabel.text = alert.properties?.event
        startLabel.text = formatDate((alert.properties?.effective)!)
        endLabel.text = formatDate(end)
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropAll
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        
        durationLabel.text = formatter.string(from: (alert.properties?.ends)!.timeIntervalSince((alert.properties?.effective)!))
        sourceLabel.text = alert.properties?.senderName
        
        if let alertId = alert.id {
            if alertImages.keys.contains(alertId) {
                // Chose to use the URL as storing all the images might eat up storage quickly. Currently there is 470 alerts and would rather redownload the small files instead of storing them.
                alertImageView.sd_setImage(with: alertImages[alertId])
            } else {
                // Added 1 to make the images more interesting
                alertImageView.sd_setImage(with: URL(string: "https://picsum.photos/id/1\(row)/60"), completed: { (image, error, cacheType, url) in
                    modifiedAlertImages[alertId] = url
                    completion(modifiedAlertImages)
                })
            }
        }
    }
    
    func formatDate(_ date: Date) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ" // ISO 8601 format
//
//        if let isoDate = dateFormatter.date(from: dateString) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            return outputDateFormatter.string(from: date)
//        }
    }
}
