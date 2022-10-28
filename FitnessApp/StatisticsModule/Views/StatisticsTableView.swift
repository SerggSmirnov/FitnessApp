//
//  StatisticsTableView.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 09.10.2022.
//

import UIKit

class StatisticsTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        setupViews()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var differenceArray = [DifferenceWorkout]()
    
    private func setupViews() {
        self.backgroundColor = .none
        self.separatorStyle = .none
        self.bounces = true
        self.showsVerticalScrollIndicator = false
        self.delaysContentTouches = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(StatisticsTableViewCell.self, forCellReuseIdentifier: idStatisticsTableViewCell)
    }
    
    private let idStatisticsTableViewCell = "idStatisticsTableViewCell"
    
    private func setDelegates() {
        self.delegate = self
        self.dataSource = self
    }
    
    public func setDifferenceArray(array: [DifferenceWorkout]) {
        differenceArray = array
    }
}

//MARK: - UITableViewDataSource

extension StatisticsTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        differenceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.dequeueReusableCell(withIdentifier: idStatisticsTableViewCell, for: indexPath) as?
                StatisticsTableViewCell else {
            return UITableViewCell()
        }
        let model = differenceArray[indexPath.row]
        cell.configure(differenceWorkout: model)
        return cell
    }
}

//MARK: - UITableViewDelegate

extension StatisticsTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
