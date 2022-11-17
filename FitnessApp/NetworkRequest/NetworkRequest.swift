//
//  NetworkRequest.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 17.11.2022.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {}
    
//  https://api.openweathermap.org/data/2.5/weather?&appid=b5d83b5c0289595b2e8a0170e5f2eef0&units=metric&lat=55.96&lon=38.04
    
    func requestData(completion: @escaping (Result<Data, Error>) -> Void) {
        let key = "b5d83b5c0289595b2e8a0170e5f2eef0"
        let latitude = 55.96
        let longitude = 38.04
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?&appid=b5d83b5c0289595b2e8a0170e5f2eef0&units=metric&lat=\(latitude)&lon=\(longitude)&appid=\(key)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}
