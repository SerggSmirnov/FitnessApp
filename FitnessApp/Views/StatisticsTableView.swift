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
    
    private func setupViews() {
        self.backgroundColor = .none
        self.separatorStyle = .none
        self.bounces = false
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
}

//MARK: - UITableViewDataSource

extension StatisticsTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.dequeueReusableCell(withIdentifier: idStatisticsTableViewCell, for: indexPath) as?
                StatisticsTableViewCell else {
            return UITableViewCell()
        }
      
        return cell
    }
}

//MARK: - UITableViewDelegate

extension StatisticsTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
