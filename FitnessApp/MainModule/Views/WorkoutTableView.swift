//
//  WorkoutView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 09.10.2022.
//

import UIKit

class WorkoutTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        setupViews()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .none
        self.separatorStyle = .none
        self.bounces = true
        self.showsVerticalScrollIndicator = false
        self.delaysContentTouches = false
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(WorkoutTableViewCell.self, forCellReuseIdentifier: idTableViewCell)
    }
    
    private let idTableViewCell = "idTableViewCell"
    
    private func setDelegates() {
        self.delegate = self
        self.dataSource = self
    }
    
}

//MARK: - UITableViewDataSource

extension WorkoutTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.dequeueReusableCell(withIdentifier: idTableViewCell, for: indexPath) as?
                WorkoutTableViewCell else {
            return UITableViewCell()
        }
      
        return cell
    }
}

//MARK: - UITableViewDelegate

extension WorkoutTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
