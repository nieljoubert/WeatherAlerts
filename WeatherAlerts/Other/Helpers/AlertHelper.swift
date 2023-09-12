//
//  AlertHelper.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/09/04.
//

import Foundation
import UIKit

struct AlertHelper {
    
    static private func topViewController() -> UIViewController? {
        guard var topController = UIApplication.shared.windows.first?.rootViewController else {
            return nil
        }
        
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        
        return topController
    }
    
    static func showAlert(title: String? = "Error", message: String?, preferredStyle: UIAlertController.Style = .alert, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .default, handler: nil)]) {
        
        guard let viewController = topViewController() else {
            return
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        for action in actions {
            alertController.addAction(action)
        }
        
        DispatchQueue.main.async {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
}
