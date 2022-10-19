//
//  RealmManager.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 18.10.2022.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    let realm = try! Realm()
    
    func saveWorkoutModel(_ model: WorkoutModel) {
        try! realm.write {
            realm.add(model)
        }
    }
}

