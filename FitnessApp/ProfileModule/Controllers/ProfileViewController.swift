//
//  ProfileViewController.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 05.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    private let workoutsCollectionView = WorkoutsCollectionView()
    public let targetLabel = UILabel(text: "TARGET: 20 workouts",
                                      font: .robotoBold16(),
                                      textColor: .specialGray)
    
    public let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = .specialLightBrown
        progressView.progressTintColor = .specialGreen
        progressView.layer.cornerRadius = 14
        progressView.clipsToBounds = true
        progressView.setProgress(0, animated: false)
        progressView.layer.sublayers?[1].cornerRadius = 14
        progressView.subviews[1].clipsToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private let workoutsNowLabel = UILabel(text: "0", font: .robotoBold24(), textColor: .specialGray)
    private let workoutsTargetLabel = UILabel(text: "0", font: .robotoBold24(), textColor: .specialGray)
    
    private var targetStackView = UIStackView()
    
    private let targetView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .specialLightBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewWillLayoutSubviews() {
        profileView.userPhotoImageView.layer.cornerRadius = profileView.userPhotoImageView.frame.width / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        workoutsCollectionView.resultWorkout = [ResultWorkout]()
        getWorkoutResults()
        workoutsCollectionView.reloadData()
        profileView.setupUserParameters()
        setupUserParameters()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(profileView)
        view.addSubview(workoutsCollectionView)
        view.addSubview(targetLabel)
        targetStackView = UIStackView(arrangedSubviews: [workoutsNowLabel, workoutsTargetLabel],
                                         axis: .horizontal,
                                         spacing: 10)
        view.addSubview(targetStackView)
        view.addSubview(targetView)
        
        view.addSubview(progressView)
    }
    
    private func getWorkoutsName() -> [String] {
        var nameArray = [String]()
        
        let allWorkout = RealmManager.shared.getResultsWorkoutModel()
        
        for workoutModel in allWorkout {
            if !nameArray.contains(workoutModel.workoutName) {
                nameArray.append(workoutModel.workoutName)
            }
        }
        return nameArray
    }
    
    private func getWorkoutResults() {
        
        let nameArray = getWorkoutsName()
        let workoutArray = RealmManager.shared.getResultsWorkoutModel()
        
        for name in nameArray {
            let predicateName = NSPredicate(format: "workoutName = '\(name)'")
            let filtredArray = workoutArray.filter(predicateName).sorted(byKeyPath: "workoutName")
            var result = 0
            var image: Data?
            filtredArray.forEach { model in
                result += model.workoutReps
                image = model.workoutImage
            }
            let resultModel = ResultWorkout(name: name, result: result, imageData: image)
            workoutsCollectionView.resultWorkout.append(resultModel)
        }
    }
    
    private func setupUserParameters() {
        
        let userArray = RealmManager.shared.getResultsUserModel()
        
        if userArray.count != 0 {
            targetLabel.text = "TARGET: \(userArray[0].userTarget)"
            workoutsTargetLabel.text = "\(userArray[0].userTarget)"
            
        }
    }
}

//MARK: - setConstraints

extension ProfileViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            profileView.heightAnchor.constraint(equalToConstant: 230),
            
            workoutsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 270),
            workoutsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            workoutsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            workoutsCollectionView.heightAnchor.constraint(equalToConstant: 250),
            
            targetLabel.topAnchor.constraint(equalTo: workoutsCollectionView.bottomAnchor, constant: 10),
            targetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
  
            targetStackView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 10),
            targetStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            targetStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
 
            targetView.topAnchor.constraint(equalTo: targetStackView.bottomAnchor, constant: 3),
            targetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            targetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            targetView.heightAnchor.constraint(equalToConstant: 28),

            progressView.topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: 20),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
}

