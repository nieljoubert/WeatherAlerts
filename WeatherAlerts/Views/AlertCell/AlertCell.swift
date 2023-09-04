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
    func setValues(for weatherAlert: WeatherAlert?) {
        guard let alert = weatherAlert,
              let name = alert.properties?.name,
              let start = alert.properties?.start,
              let end = alert.properties?.end,
              let source = alert.properties?.source
        else {
            return
        }
        
        nameLabel.text = name
        startLabel.text = start.formattedForDisplay()
        endLabel.text = end.formattedForDisplay()
        durationLabel.text = end.formatDurationToWords(from: start)
        sourceLabel.text = source
        
        NetworkingManager.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.alertImageView.image = UIImage(data: data)
                }
            case .failure(let error):
                AlertHelper.showAlert(message: error.localizedDescription)
                break
            }
        }
    }
}
