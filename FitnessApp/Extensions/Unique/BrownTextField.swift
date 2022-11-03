//
//  BrownTextField.swift
//  MyFirstApp_03.10.
//
//  Created by Сергей Горбачёв on 13.10.2022.
//

import UIKit

protocol BrownTextfieldProtocol: AnyObject {
    func typing(shouldChangeCharactersIn range: NSRange, replacementString string: String)
    func clear()
}

class BrownTextField: UITextField {
    
    weak var brownDelegate: BrownTextfieldProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .specialLightBrown
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = .specialGray
        font = .robotoBold20()
        leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 15,
                                                  height: 0))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension BrownTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        brownDelegate?.typing(shouldChangeCharactersIn: range, replacementString: string)
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        brownDelegate?.clear()
        return true
    }
}
