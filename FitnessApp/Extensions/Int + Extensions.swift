//
//  Int + Extensions.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 17.10.2022.
//

import Foundation

extension Int {
    
    func getTimerFromSeconds() -> String {
        
        if self / 60 == 0 {
            return "\(self % 60) sec"
        }
        
        if self % 60 == 0 {
            return "\(self / 60) min"
        }
        
        return "\(self / 60) min \(self % 60) sec"
    }
}
