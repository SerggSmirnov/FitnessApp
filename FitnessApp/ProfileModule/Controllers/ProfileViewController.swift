//
//  ProfileViewController.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 05.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        profileView.userPhotoImageView.layer.cornerRadius = profileView.userPhotoImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private let profileView = ProfileView()
    private let workoutsCollectionView = WorkoutsCollectionView()
    private let targetLabel = UILabel(text: "TARGET: 20 workouts",
                                      font: .robotoBold16(),
                                      textColor: .specialGray)
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(profileView)
        view.addSubview(workoutsCollectionView)
        view.addSubview(targetLabel)
    }
}

//MARK: - setConstraints

extension ProfileViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            workoutsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 270),
            workoutsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            workoutsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            workoutsCollectionView.heightAnchor.constraint(equalToConstant: 250),
            
            targetLabel.topAnchor.constraint(equalTo: workoutsCollectionView.bottomAnchor, constant: 10),
            targetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
    }
}

