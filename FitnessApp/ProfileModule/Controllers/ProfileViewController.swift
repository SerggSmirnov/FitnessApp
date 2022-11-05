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
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(profileView)
    }
}

//MARK: - setConstraints

extension ProfileViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            
        ])
    }
}

