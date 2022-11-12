//
//  WorkoutCollectionViewCell.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 07.11.2022.
//

import UIKit

class WorkoutCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let nameExerciseLabel: UILabel = {
        let label = UILabel()
        label.text = "BICEPS"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.font = .robotoBold24()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let workoutImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "testWorkout")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "999"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.font = .robotoBold48()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stackView = UIStackView()
    
    public func configure(model: ResultWorkout) {
        nameExerciseLabel.text = model.name
        numberLabel.text = "\(model.result)"
        
//        guard let data = model.imageData else { return }
//        let image = UIImage(data: data)
//        workoutImageView.image = image
    }
    
    private func setupViews() {
        self.layer.cornerRadius = 20
        
        self.addSubview(nameExerciseLabel)
        
        stackView = UIStackView(arrangedSubviews: [workoutImageView, numberLabel],
                                      axis: .horizontal,
                                      spacing: 10)
        self.addSubview(stackView)
    }
}

//MARK: - setConstraints

extension WorkoutCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameExerciseLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameExerciseLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: nameExerciseLabel.bottomAnchor, constant: 2)
        ])
    }
}
