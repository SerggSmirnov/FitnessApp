//
//  SliderView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 14.10.2022.
//

import UIKit

class SliderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(name: String, minValue: Float, maxValue: Float) {
        self.init(frame: .zero)
        nameLabel.text = name
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let nameLabel = UILabel(text: "Name",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private let numberLabel = UILabel(text: "0",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private lazy var slider = GreenSlider()
    
    private var stackView = UIStackView()
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, numberLabel],
                                         axis: .horizontal,
                                         spacing: 10)
        labelsStackView.distribution = .equalSpacing
        stackView = UIStackView(arrangedSubviews: [labelsStackView, slider],
                                axis: .vertical,
                                spacing: 10)
        self.addSubview(stackView)
    }
    
    @objc private func sliderChanged() {
        print(slider.value)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
