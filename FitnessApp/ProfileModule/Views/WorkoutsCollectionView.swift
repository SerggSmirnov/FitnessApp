//
//  WorkoutsCollectionView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 06.11.2022.
//

import UIKit

class WorkoutsCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayot)
        
        setupLayout()
        configure()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let collectionLayot = UICollectionViewFlowLayout()
    private let idWorkoutCell = "idWorkoutCell"
    private let spacing: CGFloat = 14.0
    
    public var resultWorkout = [ResultWorkout]()
    
    private func setupLayout() {
        collectionLayot.scrollDirection = .horizontal
        collectionLayot.collectionView?.showsHorizontalScrollIndicator = false
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        register(WorkoutCollectionViewCell.self, forCellWithReuseIdentifier: idWorkoutCell)
    }
    
    private func setDelegates() {
        self.dataSource = self
        self.delegate = self
    }
    
    
}

//MARK: - UICollectionViewDataSource

extension WorkoutsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        resultWorkout.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idWorkoutCell, for: indexPath) as? WorkoutCollectionViewCell else { return UICollectionViewCell() }
        let model = resultWorkout[indexPath.row]
        cell.configure(model: model)
        cell.backgroundColor = (indexPath.row % 4 == 0 || indexPath.row % 4 == 3) ? .specialGreen : .specialDarkYellow
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension WorkoutsCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension WorkoutsCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width - spacing) / 2,
               height: (collectionView.frame.height - spacing) / 2)
    }
}
