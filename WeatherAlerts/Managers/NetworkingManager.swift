//
//  NetworkingManager.swift
//  WeatherAlerts
//
//  Created by Niel Joubert on 2023/08/31.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case requestFailed(Error)
}

struct NetworkingManager {
     
    static func fetchWeatherAlerts(_ completion: @escaping (Result<[WeatherAlert], Error>) -> Void) {
        guard let url = URL(string: "https://api.weather.gov/alerts/active?status=actual&message_type=alert") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                       
            guard let data = data, error == nil else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(WeatherAlertsResponse.self, from: data)
                completion(.success(response.alerts ?? []))
            } catch let decodingError as NSError {
                print("JSON decoding failed: \(decodingError.localizedDescription)")//\n\n\(String(decoding: data, as: UTF8.self))")
                completion(.failure(decodingError))
            }
        }.resume()
    }
    
    static func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "https://picsum.photos/60") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                       
            guard let data = data, error == nil else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}
