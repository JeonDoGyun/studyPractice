//
//  MainLogoButton.swift
//  CustomView
//
//  Created by 전도균 on 2022/09/07.
//

import UIKit

class MainLogoButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainLogoButton {
    private func setUI() {
        layer.cornerRadius = 4
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.borderWidth = 1
        backgroundColor = .systemBlue
        setTitleColor(.white, for: .normal)
    }
    
    private func setLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 80),
            heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
