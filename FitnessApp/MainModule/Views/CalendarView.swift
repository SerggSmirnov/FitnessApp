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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let collectionView = CalendarCollectionView()
    
    private func setupViews() {
        self.backgroundColor = .specialGreen
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        addShadowOnView()
        
        addSubview(collectionView)
    }
    
    public func setDelegate(_ delegate: CalendarViewProtocol?) {
        collectionView.calendarDelegate = delegate
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
