//
//  StatisticViewController.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 09.10.2022.
//

import UIKit


class StatisticsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(statisticsLabel)
        view.addSubview(exercisesLabel)
        view.addSubview(statisticsTableView)
    }
    
    private let statisticsLabel: UILabel = {
        let label = UILabel()
        label.text = "STATISTICS"
        
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let exercisesLabel: UILabel = {
        let label = UILabel()
        label.text = "Exercises"
        
        label.font = .robotoMedium14()
        label.textColor = .specialBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statisticsTableView = StatisticsTableView()
}

//MARK: - setConstraints

extension StatisticsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            statisticsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            statisticsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            exercisesLabel.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 70),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            statisticsTableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 0),
            statisticsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            statisticsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            statisticsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
