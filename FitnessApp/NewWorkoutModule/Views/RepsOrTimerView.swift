//
//  RepsOrTimerView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 12.10.2022.
//

import UIKit

class RepsOrTimerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let repsOrTimerLabel = UILabel(text: "Reps or timer")
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightBrown
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let setsView = SliderView(name: "Sets", minValue: 0, maxValue: 10)
    let repsView = SliderView(name: "Reps", minValue: 0, maxValue: 50)
    let timerView = SliderView(name: "Timer", minValue: 0, maxValue: 600)
    
    private let repeatOrTimerLabel = UILabel(text: "Choose repeat or timer")
    
    private var stackView = UIStackView()
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        repeatOrTimerLabel.textAlignment = .center
        
        self.addSubview(repsOrTimerLabel)
        self.addSubview(backView)
        
        stackView = UIStackView(arrangedSubviews: [setsView,
                                                  repsView,
                                                  timerView],
                                axis: .vertical,
                                spacing: 20)
        backView.addSubview(stackView)
    }
}

extension RepsOrTimerView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            backView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 3),
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),

            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15)
        ])
    }
}
