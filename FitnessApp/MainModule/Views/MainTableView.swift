//
//  WorkoutView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 09.10.2022.
//

import UIKit

protocol MainTableViewProtocol: AnyObject {
    func deleteWorkout(model: WorkoutModel, index: Int)
}

class MainTableView: UITableView {
    
    weak var mainTableViewDelegate: MainTableViewProtocol?
    
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
        let workoutModel = workoutsArray[indexPath.row]
        cell.configure(model: workoutModel)
        cell.workoutCellDelegate = mainTableViewDelegate as? WorkoutCellProtocol
        return cell
    }
}

//MARK: - UITableViewDelegate

extension MainTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "", handler: {_, _, _ in
            let deleteModel = self.workoutsArray[indexPath.row]
            self.mainTableViewDelegate?.deleteWorkout(model: deleteModel, index: indexPath.row)
        })
        
        action.backgroundColor = .specialBackground
        action.image = UIImage(named: "delete")
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}
