//
//  CalendarView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 04.10.2022.
//

import UIKit

class CalendarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 3
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    private let idCalendarCell = "idCalendarCell"
    
    private func setupViews() {
        self.backgroundColor = .specialGreen
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        addShadowOnView()
        
        addSubview(collectionView)
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

//MARK: - UICollectionViewDataSource

extension CalendarView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as? CalendarCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension CalendarView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension CalendarView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 8, height: collectionView.frame.height)
    }
}


//MARK: - Constraints

extension CalendarView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 105),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}
