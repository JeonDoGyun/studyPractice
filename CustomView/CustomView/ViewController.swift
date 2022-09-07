//
//  ViewController.swift
//  CustomView
//
//  Created by 전도균 on 2022/09/07.
//

import UIKit

class ViewController: UIViewController {
    
    let threeButtonView = ThreeButtonView()

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
