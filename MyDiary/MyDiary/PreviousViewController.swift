//
//  PreviousViewController.swift
//  MyDiary
//
//  Created by 전도균 on 2022/10/09.
//

import UIKit

class PreviousViewController: UIViewController {
    
    let pushButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension PreviousViewController {
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(pushButton)
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        
        pushButton.setTitle("보기", for: .normal)
        pushButton.addTarget(self, action: #selector(didTapPopButton(_:)), for: .touchUpInside)
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushButton.widthAnchor.constraint(equalToConstant: 100),
            pushButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

extension PreviousViewController {
    @objc
    private func didTapPopButton(_ sender: UIButton) {
        let mainVC = ViewController()
        mainVC.navigationItem.title = "Title"
        navigationController?.pushViewController(mainVC, animated: true)
    }
}
