//
//  MainViewController.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/08/31.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private var viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AlertCell", bundle: nil), forCellReuseIdentifier: "AlertCell")
        fetchWeatherAlerts()
    }
    
    private func fetchWeatherAlerts() {
        viewModel.fetchAlerts { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - TableViewDataSource -
extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.alerts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlertCell", for: indexPath) as! AlertCell
        
        cell.setValues(for: viewModel.alerts[indexPath.row], at: indexPath.row, alertImages: viewModel.alertImages) { [weak self] images in
            self?.viewModel.alertImages = images
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - TableviewDelegate -
extension MainTableViewController {

}

