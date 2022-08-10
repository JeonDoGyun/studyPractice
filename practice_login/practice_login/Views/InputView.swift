//
//  TextFieldView.swift
//  practice_login
//
//  Created by 전도균 on 2022/08/10.
//

import UIKit

class InputView: UIView {
    
    enum TextFieldType: String {
        case id = "아이디"
        case password = "패스워드"
    }
    
    private let inputLabel = UILabel()
    private let inputTextField = UITextField()
    
    var text: String? {
        return inputTextField.text
    }
    
    init(type: TextFieldType) {
        super.init(frame: .zero)
        
        inputLabel.text = type.rawValue
        inputLabel.font = UIFont.systemFont(ofSize: 13)
        inputLabel.textColor = .gray
        
        inputTextField.autocapitalizationType = .none
        inputTextField.layer.borderColor = UIColor.gray.cgColor
        inputTextField.layer.borderWidth = 0.5
        inputTextField.layer.cornerRadius = 4
        if type == .password {
            inputTextField.isSecureTextEntry = true
        }
        
        addSubview(inputLabel)
        addSubview(inputTextField)
        
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputLabel.topAnchor.constraint(equalTo: topAnchor),
            inputLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            inputTextField.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 8),
            inputTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            inputTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            inputTextField.bottomAnchor.constraint(equalTo: bottomAnchor), 
            inputTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
