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
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherDiscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Nice weather to workout outside"
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        label.numberOfLines = 2
        
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
        self.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        self.layer.cornerRadius = 10
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(weatherLabel)
        self.addSubview(weatherDiscriptionLabel)
        self.addSubview(weatherLogoImageView)
    }
}

extension WeatherView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            weatherLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            weatherLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -82),
            
            weatherDiscriptionLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5),
            weatherDiscriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            weatherDiscriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -82),
            
            weatherLogoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            weatherLogoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            weatherLogoImageView.heightAnchor.constraint(equalToConstant: 62),
            weatherLogoImageView.widthAnchor.constraint(equalToConstant: 62)
        ])
    }
}
