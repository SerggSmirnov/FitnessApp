//
//  NewWorkoutViewController.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 11.10.2022.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private let newWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "NEW WORKOUT"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(newWorkoutLabel)
    }
}

//MARK: - setConstraints

extension NewWorkoutViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
}

