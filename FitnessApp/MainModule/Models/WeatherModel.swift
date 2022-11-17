//
//  WeatherModel.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 15.11.2022.
//
import Foundation

// MARK: - WeatherModel
struct WeatherModel: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

// MARK: - Main
struct Main: Decodable {
    let temp, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - Weather
struct Weather: Decodable {
    let weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
}
