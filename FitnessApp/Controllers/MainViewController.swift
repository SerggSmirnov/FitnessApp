//
//  ViewController.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 04.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .specialLightBrown
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Your name"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle("Add workout", for: .normal)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.tintColor = .specialDarkGreen
        button.titleLabel?.font = .robotoMedium12()
        button.imageEdgeInsets = .init(top: 0,
                                       left: 20,
                                       bottom: 15,
                                       right: 0)
        button.titleEdgeInsets = .init(top: 50,
                                       left: -40,
                                       bottom: 0,
                                       right: 0)
        button.addShadowOnView()
        button.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func addWorkoutButtonTapped() {
        print("addWorkoutButtonTapped")
    }
    
    private let calendarView = CalendarView()
    
    private let weatherView = WeatherView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
    }


}

//MARK: - Constraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
        userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
        userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
        
        calendarView.topAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor),
        calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        calendarView.heightAnchor.constraint(equalToConstant: 70),
        
        userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
        userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 5),
        userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        
        addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
        addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
        addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
        
        weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
        weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
        weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        weatherView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
