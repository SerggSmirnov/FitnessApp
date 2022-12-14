//
//  StatisticViewController.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 09.10.2022.
//

import UIKit


class StatisticsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setStartScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        differenceArray = [DifferenceWorkout]()
        setStartScreen()
    }
    
    private let statisticsLabel: UILabel = {
        let label = UILabel()
        label.text = "STATISTICS"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let exercisesLabel: UILabel = {
        let label = UILabel()
        label.text = "Exercises"
        label.font = .robotoMedium14()
        label.textColor = .specialBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Week", "Month"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .specialGreen
        segmentedControl.selectedSegmentTintColor = .specialYellow
        let font = UIFont(name: "Roboto-Medium", size: 16)
        segmentedControl.setTitleTextAttributes([.font : font as Any,
                                                 .foregroundColor : UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([.font : font as Any,
                                                 .foregroundColor : UIColor.specialGray], for: .selected)
        segmentedControl.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let nameTextField = BrownTextField()
    
    private let tableView = StatisticsTableView()
    
    private var workoutArray = [WorkoutModel]()
    private var differenceArray = [DifferenceWorkout]()
    private var filtredArray = [DifferenceWorkout]()
    
    private var isFiltred = false
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(statisticsLabel)
        view.addSubview(segmentedControl)
        view.addSubview(nameTextField)
        nameTextField.brownDelegate = self
        view.addSubview(exercisesLabel)
        view.addSubview(tableView)
    }
    
    @objc private func segmentedChange() {
        
        let dateToday = Date().localDate()
        differenceArray = [DifferenceWorkout]()
        
        if segmentedControl.selectedSegmentIndex == 0 {
            let dateStart = dateToday.offsetDay(day: 7)
            getDifferenceModel(dateStart: dateStart)
        } else {
            let dateStart = dateToday.offsetMonth(month: 7)
            getDifferenceModel(dateStart: dateStart)
        }
        tableView.reloadData()
    }
    
    private func getWorkoutsName() -> [String] {
        var nameArray = [String]()
        
        let allWorkout = RealmManager.shared.getResultsWorkoutModel()
        
        for workoutModel in allWorkout {
            if !nameArray.contains(workoutModel.workoutName) {
                nameArray.append(workoutModel.workoutName)
            }
        }
        return nameArray
    }
    
    private func getDifferenceModel(dateStart: Date) {
        let dateEnd = Date().localDate()
        let nameArray = getWorkoutsName()
        let allWorkouts = RealmManager.shared.getResultsWorkoutModel()
        
        for name in nameArray {
            let predicateDifference = NSPredicate(format: "workoutName = '\(name)' AND workoutDate BETWEEN %@", [dateStart, dateEnd])
            let filtredArray = allWorkouts.filter(predicateDifference).sorted(byKeyPath: "workoutDate")
            workoutArray = filtredArray.map{$0}
            
            guard let last = workoutArray.last?.workoutReps,
                  let first = workoutArray.first?.workoutReps else {
                return
            }
            
            let differenceWorkout = DifferenceWorkout(name: name, lastReps: last, firstReps: first)
            differenceArray.append(differenceWorkout)
        }
        tableView.setDifferenceArray(array: differenceArray)
    }
    
    private func setStartScreen() {
        let dateToday = Date().localDate()
        getDifferenceModel(dateStart: dateToday.offsetDay(day: 7))
        tableView.reloadData()
    }
    
    private func filtringWorkouts(text: String) {
        for workout in differenceArray {
            if  workout.name.lowercased().contains(text.lowercased()) {
                filtredArray.append(workout)
            }
        }
    }
}

//MARK: - BrownTextfieldProtocol

extension StatisticsViewController: BrownTextfieldProtocol {
    func typing(shouldChangeCharactersIn range: NSRange, replacementString string: String) {
        if let text = nameTextField.text,
           let textRange = Range(range, in: text) {
            let updateText = text.replacingCharacters(in: textRange, with: string)
            filtredArray = [DifferenceWorkout]()
            isFiltred = updateText.count > 0
            filtringWorkouts(text: updateText)
        }
        if isFiltred {
            tableView.setDifferenceArray(array: filtredArray)
        } else {
            tableView.setDifferenceArray(array: differenceArray)
        }
        tableView.reloadData()
    }
    
    func clear() {
        isFiltred = false
        differenceArray = [DifferenceWorkout]()
        let dateToday = Date().localDate()
        getDifferenceModel(dateStart: dateToday.offsetDay(day: 7))
        tableView.reloadData()
    }
}

//MARK: - setConstraints

extension StatisticsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            statisticsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            statisticsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 30),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 38),
            
            exercisesLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
