//
//  ViewController.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 04.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .specialLine
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Your name"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let workoutTodayLabel: UILabel = {
        let label = UILabel()
        label.text = "Workout Today"
        label.font = .robotoMedium14()
        label.textColor = .specialBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle("Add workout", for: .normal)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.tintColor = .specialDarkGreen
        button.titleLabel?.font = .robotoMedium12()
        button.imageEdgeInsets = .init(top: 0,
                                       left: 20,
                                       bottom: 15,
                                       right: 0)
        button.titleEdgeInsets = .init(top: 50,
                                       left: -40,
                                       bottom: 0,
                                       right: 0)
        button.addShadowOnView()
        button.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let noTrainingImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "noTraining")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let calendarView = CalendarView()
    private let weatherView = WeatherView()
    private let tableView = MainTableView()
    private var workoutArray = [WorkoutModel]()
    
    override func viewWillLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        selectItem(date: Date().localDate())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(calendarView)
        calendarView.setDelegate(self)
        view.addSubview(userPhotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
        view.addSubview(workoutTodayLabel)
        view.addSubview(tableView)
        tableView.mainTableViewDelegate = self
        view.addSubview(noTrainingImageView)
    }

    @objc private func addWorkoutButtonTapped() {
        let newWorkoutVC = NewWorkoutViewController()
        newWorkoutVC.modalPresentationStyle = .fullScreen
        present(newWorkoutVC, animated: true)
    }
    
    private func getWorkouts(date: Date) {
        let weekday = date.getWeekDayNumber()
        let dateStart = date.startEndDate().0
        let dateEnd = date.startEndDate().1
        
        let predicateRepeat = NSPredicate(format: "workoutNumberOfDay = \(weekday) AND workoutRepeat = true")
        let predicateUnrepeat = NSPredicate(format: "workoutRepeat = false AND workoutDate BETWEEN %@", [dateStart, dateEnd])
        let compound = NSCompoundPredicate(type: .or, subpredicates: [predicateRepeat, predicateUnrepeat])
        let resultArray = RealmManager.shared.getResultWorkoutModel()
        let filtredArray = resultArray.filter(compound).sorted(byKeyPath: "workoutName")
        workoutArray = filtredArray.map{$0}
    }
    
    private func checkWorkoutToday() {
        if workoutArray.count == 0 {
            noTrainingImageView.isHidden = false
            tableView.isHidden = true
        } else {
            noTrainingImageView.isHidden = true
            tableView.isHidden = false
        }
    }

}

//MARK: - CalendarViewProtocol

extension MainViewController: CalendarViewProtocol {
    func selectItem(date: Date) {
        getWorkouts(date: date)
        tableView.setWorkoutArray(array: workoutArray)
        tableView.reloadData()
        checkWorkoutToday()
    }
    
    
}

//MARK: - MainTableViewProtocol

extension MainViewController: MainTableViewProtocol {
    func deleteWorkout(model: WorkoutModel, index: Int) {
        RealmManager.shared.deleteWorkoutModel(model)
        workoutArray.remove(at: index)
        tableView.setWorkoutArray(array: workoutArray)
        tableView.reloadData()
    }
}

//MARK: - WorkoutCellProtocol

extension MainViewController: WorkoutCellProtocol {
    func startButtonTapped(model: WorkoutModel) {
        if model.workoutTimer == 0 {
            let repsWorkouViewController = RepsWorkoutViewController()
            repsWorkouViewController.modalPresentationStyle = .fullScreen
            repsWorkouViewController.setWorkoutModel(model)
            present(repsWorkouViewController, animated: true)
        } else {
            let timerWorkouViewController = TimerWorkoutViewController()
            timerWorkouViewController.modalPresentationStyle = .fullScreen
            timerWorkouViewController.setWorkoutModel(model)
            present(timerWorkouViewController, animated: true)
        }
    }
}

//MARK: - Constraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
        userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
        userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
        
        calendarView.topAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor),
        calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        calendarView.heightAnchor.constraint(equalToConstant: 70),
        
        userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
        userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 5),
        userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        
        addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
        addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
        addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
        
        weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
        weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
        weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        weatherView.heightAnchor.constraint(equalToConstant: 80),
        
        workoutTodayLabel.topAnchor.constraint(equalTo: addWorkoutButton.bottomAnchor, constant: 10),
        workoutTodayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        
        tableView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor, constant: 0),
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        
        noTrainingImageView.topAnchor.constraint(equalTo: workoutTodayLabel.bottomAnchor, constant: 0),
        noTrainingImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        noTrainingImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        noTrainingImageView.heightAnchor.constraint(equalTo: noTrainingImageView.widthAnchor, multiplier: 1)
        ])
    }
}
