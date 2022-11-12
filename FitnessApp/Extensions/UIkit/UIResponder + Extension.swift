//
//  UIResponder + Extension.swift
//  FitnessApp
//
//  Created by Сергей Смирнов on 10.11.2022.
//

import UIKit

extension UIResponder {
    func next<T:UIResponder>(ofType: T.Type) -> T? {
        let r = self.next
        if let r = r as? T ?? r?.next(ofType: T.self) {
            return r
        } else {
            return nil
        }
    }
}
