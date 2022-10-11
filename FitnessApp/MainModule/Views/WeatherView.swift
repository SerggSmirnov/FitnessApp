//
//  WeatherView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 04.10.2022.
//

import UIKit

class WeatherView: UIView {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let weatherStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherDiscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Nice weather to workout outside"
        label.numberOfLines = 2
        label.textColor = .specialGray
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoSun")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupViews() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        addShadowOnView()
        
        self.addSubview(weatherStatusLabel)
        self.addSubview(weatherDiscriptionLabel)
        self.addSubview(weatherLogoImageView)
    }
}

extension WeatherView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weatherStatusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            weatherStatusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            weatherStatusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -82),
            
            weatherDiscriptionLabel.topAnchor.constraint(equalTo: weatherStatusLabel.bottomAnchor, constant: 5),
            weatherDiscriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            weatherDiscriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -82),
            
            weatherLogoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            weatherLogoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            weatherLogoImageView.heightAnchor.constraint(equalToConstant: 62),
            weatherLogoImageView.widthAnchor.constraint(equalToConstant: 62)
        ])
    }
}
