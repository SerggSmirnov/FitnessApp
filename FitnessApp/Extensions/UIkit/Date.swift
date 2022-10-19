//
//  Date.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 18.10.2022.
//

import Foundation

extension Date {
    
    func getWeekDayNumber() -> Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}
