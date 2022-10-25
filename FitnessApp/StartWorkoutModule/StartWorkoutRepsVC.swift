//
//  StartWorkoutRepsVC.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 19.10.2022.
//

import UIKit

class StartWorkoutRepsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private let startWorkoutLabel = UILabel(text: "START WORKOUT",
                                          font: .robotoMedium24(),
                                          textColor: .specialGray)
    
    lazy var closeButton = CloseButton(type: .system)
    
    private let femaleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "female")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let detailsView = DetailsRepsView(name: "Biceps")
    
    private lazy var finishButton = GreenButton(text: "FINISH")
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.addSubview(femaleImageView)
        view.addSubview(detailsView)
        view.addSubview(finishButton)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func finishButtonTapped() {
        print("finishButtonTapped")
    }
}

//MARK: - setConstraints

extension StartWorkoutRepsVC {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            femaleImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 25),
            femaleImageView.centerXAnchor.constraint(equalTo: startWorkoutLabel.centerXAnchor),
            femaleImageView.widthAnchor.constraint(equalToConstant: 189),
            femaleImageView.heightAnchor.constraint(equalToConstant: 250),
            
            detailsView.topAnchor.constraint(equalTo: femaleImageView.bottomAnchor, constant: 25),
            detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailsView.heightAnchor.constraint(equalToConstant: 265),
            
            finishButton.topAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: 15),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
}

