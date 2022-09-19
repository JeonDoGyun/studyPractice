//
//  ViewController.swift
//  CustomView
//
//  Created by 전도균 on 2022/09/07.
//

import UIKit

class ViewController: UIViewController {
    
    let threeButtonView = ThreeButtonView()
    let mainLogoButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @objc
    func didTapButton(_ sender: UIButton) {
        print(#function)
    }
}

extension ViewController {
    private func setUI() {
        threeButtonView.mainLogoButtons.forEach {
            $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        }
        
        mainLogoButton.setTitle("Logo", for: .normal)
        mainLogoButton.layer.cornerRadius = 4
        mainLogoButton.layer.borderColor = UIColor.systemBlue.cgColor
        mainLogoButton.layer.borderWidth = 1
        mainLogoButton.backgroundColor = .systemBlue
        mainLogoButton.setTitleColor(.white, for: .normal)
        view.addSubview(mainLogoButton)
        mainLogoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLogoButton.topAnchor.constraint(equalTo: view.topAnchor),
            mainLogoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainLogoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainLogoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        
        view.addSubview(threeButtonView)
        threeButtonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            threeButtonView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            threeButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            threeButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            threeButtonView.heightAnchor.constraint(equalToConstant: 200)
        ])
    
        
    }
}
