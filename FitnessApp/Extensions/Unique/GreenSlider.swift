//
//  GreenSlider.swift
//  MyFirstApp_03.10.
//
//  Created by Сергей Горбачёв on 13.10.2022.
//

import UIKit

class GreenSlider: UISlider {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(minValue: Float, maxValue: Float) {
        self.init(frame: .zero)
        minimumValue = minValue
        maximumValue = maxValue
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        maximumTrackTintColor = .specialBrown
        minimumTrackTintColor = .specialGreen
        translatesAutoresizingMaskIntoConstraints = false
    }
}
