//
//  DetailsView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 20.10.2022.
//

import UIKit

class DetailsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let detailsLabel = UILabel(text: "Details")
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightBrown
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let exerciseLabel = UILabel(text: "Biceps",
                                    font: .robotoMedium24(),
                                    textColor: .specialGray)
    
    private let setsView = SetsOrRepsView(name: "Sets")
    
    private let repsView = SetsOrRepsView(name: "Reps")
    
    private var stackView = UIStackView()
    
    private lazy var editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.tintColor = .specialEditing
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.setTitle("Editing", for: .normal)
        button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nextSetButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialDarkYellow
        button.tintColor = .specialGray
        button.titleLabel?.font = .robotoBold16()
        button.layer.cornerRadius = 10
        button.setTitle("NEXT SET", for: .normal)
        button.addTarget(self, action: #selector(nextSetButtonTapped), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func editingButtonTapped() {
        print("editingButtonTapped")
    }
    
    @objc private func nextSetButtonTapped() {
        print("nextSetButtonTapped")
    }
    
    private func setupViews() {
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(detailsLabel)
        self.addSubview(backView)
        backView.addShadowOnView()
        
        stackView = UIStackView(arrangedSubviews: [exerciseLabel,
                                                  setsView,
                                                  repsView],
                                axis: .vertical,
                                spacing: 20)
        stackView.distribution = .fillEqually
        exerciseLabel.textAlignment = .center
        
        backView.addSubview(stackView)
        backView.addSubview(editingButton)
        backView.addSubview(nextSetButton)
    }
}

extension DetailsView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            detailsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            detailsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            backView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 3),
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            
            editingButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            editingButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            editingButton.heightAnchor.constraint(equalToConstant: 24),
            editingButton.widthAnchor.constraint(equalToConstant: 74),
            
            nextSetButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 12),
            nextSetButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            nextSetButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            nextSetButton.heightAnchor.constraint(equalToConstant: 43)
        ])
    }
}
