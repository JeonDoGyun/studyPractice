//
//  AddPhotoViewController.swift
//  trip
//
//  Created by 전도균 on 2023/02/01.
//

import UIKit

class AddPhotoViewController: UIViewController {
    
//    let collectionView = UICollectionView()
    let backButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setConstraints()
    }
    
    private func setUI() {
        [backButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        backButton.backgroundColor = .lightGray
        backButton.setTitle("취소", for: .normal)
        backButton.addTarget(self, action: #selector(didTappedBackButton(_:)), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 100),
            backButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

extension AddPhotoViewController {
    @objc
    private func didTappedBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
