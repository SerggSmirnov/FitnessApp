//
//  SetsOrRepsView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 20.10.2022.
//

import UIKit

class SetsOrRepsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    convenience init(name: String) {
        self.init(frame: .zero)
        nameLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private
    let nameLabel = UILabel(text: "Name",
                            font: .robotoMedium18(),
                            textColor: .specialGray)
    
    private let numberLabel = UILabel(text: "00",
                                    font: .robotoMedium24(),
                                    textColor: .specialGray)
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private func setupViews() {
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(numberLabel)
        self.addSubview(nameLabel)
        self.addSubview(separatorView)
    }
}

extension SetsOrRepsView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            numberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            nameLabel.centerYAnchor.constraint(equalTo: numberLabel.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            
            separatorView.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 3),
            separatorView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0),
            separatorView.trailingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 0),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
