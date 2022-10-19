//
//  DateAndRepeatView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 12.10.2022.
//

import UIKit

class DateAndRepeatView: UIView {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let dateAndRepeatLabel = UILabel(text: "Date and repeat")
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightBrown
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let  dateLabel = UILabel(text: "Date",
                                     font: .robotoMedium18(),
                                     textColor: .specialGray)
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .specialGreen
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let repeatLabel = UILabel(text: "Repeat every week",
                                      font: .robotoMedium18(),
                                      textColor: .specialGray)
    
    private let repeatSwitch: UISwitch = {
       let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.onTintColor = .specialGreen
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()
    
    private var dateStackView = UIStackView()
    private var repeatStackView = UIStackView()
    
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dateAndRepeatLabel)
        self.addSubview(backView)
        backView.addShadowOnView()
        dateStackView = UIStackView(arrangedSubviews: [dateLabel, datePicker],
                                    axis: .horizontal,
                                    spacing: 10)
        backView.addSubview(dateStackView)
        
        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel, repeatSwitch],
                                      axis: .horizontal,
                                      spacing: 10)
        backView.addSubview(repeatStackView)
    }
    
    public func getDataAndRepeat() -> (date: Date, repeat: Bool) {
        (datePicker.date, repeatSwitch.isOn)
    }
}

extension DateAndRepeatView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            dateAndRepeatLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            backView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 3),
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            dateStackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            dateStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            repeatStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15)
        ])
    }
}
