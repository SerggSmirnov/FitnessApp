//
//  StatisticTableViewCell.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 09.10.2022.
//

import UIKit

class StatisticsTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear 
        selectionStyle = .none
        
        addSubview(backgroundCell)
        addSubview(exerciseNameLabel)
        addSubview(statisticNumberLabel)
        addSubview(separatorView)
        
        labelsStackView = UIStackView(arrangedSubviews: [exerciseBeforeLabel, exerciseNowLabel],
                                               spacing: 10)
        
        addSubview(labelsStackView)
    }
    
    private let backgroundCell: UIView = {
       let view = UIView()
//        view.layer.cornerRadius = 20
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let separatorView: UIView = {
       let view = UIView()
//        view.layer.cornerRadius = 20
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let exerciseNameLabel: UILabel = {
        let label = UILabel()
        label.text = "PullUps"
        //        label.adjustsFontSizeToFitWidth = true
        //        label.minimumScaleFactor = 0.5
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statisticNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "+2"
        //        label.adjustsFontSizeToFitWidth = true
        //        label.minimumScaleFactor = 0.5
        label.font = .robotoMedium24()
        label.textColor = .specialGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let exerciseBeforeLabel: UILabel = {
       let label = UILabel()
        label.text = "Before: 10"
        label.textColor = .specialBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let exerciseNowLabel: UILabel = {
       let label = UILabel()
        label.text = "Before: 12"
        label.textColor = .specialBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelsStackView = UIStackView()
}

//MARK: - setConstraints

extension StatisticsTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            backgroundCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            exerciseNameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            exerciseNameLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
            
            statisticNumberLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            statisticNumberLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            
            separatorView.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: 0),
            separatorView.leadingAnchor.constraint(equalTo: exerciseNameLabel.leadingAnchor, constant: 0),
            separatorView.trailingAnchor.constraint(equalTo: statisticNumberLabel.trailingAnchor, constant: 0),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            labelsStackView.topAnchor.constraint(equalTo: exerciseNameLabel.bottomAnchor, constant: 5),
            labelsStackView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
            labelsStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
