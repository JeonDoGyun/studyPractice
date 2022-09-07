//
//  ThreeButtonView.swift
//  CustomView
//
//  Created by 전도균 on 2022/09/07.
//

import Foundation
import UIKit

class ThreeButtonView: UIView {
    let mainLogoButtons: [UIButton] = ["Logo", "Logo2", "Logo3"].map { title in
        return MainLogoButton(title: title)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ThreeButtonView {
    private func setUI() {
        for (index, button) in mainLogoButtons.enumerated() {
            addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            if index == 0 {
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
            } else {
                button.leadingAnchor.constraint(equalTo: mainLogoButtons[index - 1].trailingAnchor, constant: 20).isActive = true
            }
            NSLayoutConstraint.activate([
                button.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        }
    }
}
