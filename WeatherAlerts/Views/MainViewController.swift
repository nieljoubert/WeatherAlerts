//
//  MainViewController.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/08/31.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private var viewModel = WeatherViewModel()
    private let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        tableView.register(UINib(nibName: "AlertCell", bundle: nil), forCellReuseIdentifier: "AlertCell")
        
        fetchWeatherAlerts(showLoader: true)
    }
    
    private func configureUI() {
        configureNavBar()
        configurePullToRefresh()
        configureLoader()
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        self.title = "Weather Alerts"
    }
    
    private func configurePullToRefresh() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
    }
    
    private func configureLoader() {
        activityIndicatorView.center = CGPoint(x: view.center.x, y: view.center.y - (navigationController?.navigationBar.frame.size.height ?? 0.0))
        activityIndicatorView.hidesWhenStopped = true
        view.addSubview(activityIndicatorView)
    }
    
    private func fetchWeatherAlerts(showLoader: Bool) {
        
        if showLoader {
            activityIndicatorView.startAnimating()
        }
        
        viewModel.fetchAlerts { [weak self] in
            DispatchQueue.main.async {
                if showLoader {
                    self?.activityIndicatorView.stopAnimating()
                }
                self?.tableView.reloadData()
            }
        }
    }
    
    @objc private func handleRefresh(_ refreshControl: UIRefreshControl) {
        guard let refresh = self.refreshControl else {
            return
        }
        
        fetchWeatherAlerts(showLoader: false)
        
        refresh.endRefreshing()
    }
}

// MARK: - TableViewDataSource -
extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.alerts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlertCell", for: indexPath) as! AlertCell
        cell.setValues(for: viewModel.alerts[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - TableviewDelegate -
extension MainTableViewController {

}

