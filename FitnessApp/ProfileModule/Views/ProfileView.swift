//
//  ProfileView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 05.11.2022.
//

import UIKit

class ProfileView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "PROFILE"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .specialLine
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGreen
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addShadowOnView()
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "SERGEI SMIRNOV"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.font = .robotoBold24()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height: 178"
        label.font = .robotoBold16()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight: 70"
        label.font = .robotoBold16()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "threeDots"), for: .normal)
        button.setTitle("Editing ", for: .normal)
        button.tintColor = .specialGreen
        button.titleLabel?.font = .robotoBold16()
        button.semanticContentAttribute = .forceRightToLeft
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private func setupViews() {
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(profileLabel)
        self.addSubview(greenView)
        self.addSubview(userPhotoImageView)
        self.addSubview(nameLabel)
        self.addSubview(heightLabel)
        self.addSubview(weightLabel)
        self.addSubview(editingButton)
    }
    
    @objc func editingButtonTapped() {
       print("editingButtonTapped")
    }
}

//MARK: - setConstraints

extension ProfileView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            profileLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            greenView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 65),
            greenView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            greenView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            greenView.heightAnchor.constraint(equalToConstant: 112),
            
            userPhotoImageView.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
            userPhotoImageView.centerYAnchor.constraint(equalTo: greenView.topAnchor),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -10),
            nameLabel.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: -15),
            
            heightLabel.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 6),
            heightLabel.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 10),
            
            weightLabel.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 6),
            weightLabel.leadingAnchor.constraint(equalTo: heightLabel.trailingAnchor, constant: 15),
            
            editingButton.centerYAnchor.constraint(equalTo: heightLabel.centerYAnchor),
            editingButton.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: 0)
        ])
    }
}
