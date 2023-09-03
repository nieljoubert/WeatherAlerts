//
//  AlertCell.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/08/31.
//

import UIKit
import SDWebImage

class AlertCell: UITableViewCell {
    
    @IBOutlet private weak var alertImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var startLabel: UILabel!
    @IBOutlet private weak var endLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var sourceLabel: UILabel!
        
    // wanted to use inout for alertImages, but has an issue if AlertCell is a class and cant make it a struct
    func setValues(for weatherAlert: Feature?) {
        guard let alert = weatherAlert, let end = alert.properties?.ends else {
            return
        }
        
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
        
        NetworkingManager.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.alertImageView.image = UIImage(data: data)
                }
            case .failure(let error):
                // Error
                break
            }
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return outputDateFormatter.string(from: date)
    }
}
