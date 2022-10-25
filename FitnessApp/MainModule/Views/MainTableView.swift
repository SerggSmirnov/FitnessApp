//
//  WorkoutView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 09.10.2022.
//

import UIKit

class MainTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        configure()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var workoutsArray = [WorkoutModel]()
    
    private let idTableViewCell = "idTableViewCell"
    
    private func configure() {
        self.backgroundColor = .none
        self.separatorStyle = .none
        self.bounces = true
        self.showsVerticalScrollIndicator = false
        self.delaysContentTouches = false
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(WorkoutTableViewCell.self, forCellReuseIdentifier: idTableViewCell)
    }
    
    private func setDelegates() {
        self.delegate = self
        self.dataSource = self
    }
    
    public func setWorkoutArray(array: [WorkoutModel]) {
        workoutsArray = array
    }
    
}

//MARK: - UITableViewDataSource

extension MainTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workoutsArray.count
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

extension MainTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
