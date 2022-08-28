//
//  ViewController.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/08/25.
//

import UIKit

class StartViewController: UIViewController {
    
    let titleLabel = UILabel()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

}

extension StartViewController {
    @objc
    func didTappedButton(_ sender: UIButton) {
        let nextVC = MainViewController()
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true)
    }
}

extension StartViewController {
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(button)
        
        titleLabel.text = "ShelfLife"
        titleLabel.font = titleLabel.font.withSize(50)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .red
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.sizeToFit()
        
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTappedButton(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            //titleLabel
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            
            
            //button
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            button.heightAnchor.constraint(equalToConstant: 50),
//            button.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
