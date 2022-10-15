//
//  NameView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 13.10.2022.
//

import UIKit

class NameView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let nameLabel = UILabel(text: "Name")
    private let nameTextField = BrownTextField()
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameLabel)
        addSubview(nameTextField)
    }
}

extension NameView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 16),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            nameTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
