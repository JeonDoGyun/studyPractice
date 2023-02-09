//
//  AddPhotoViewController.swift
//  trip
//
//  Created by 전도균 on 2023/02/01.
//

import UIKit
import FSCalendar

class AddPhotoViewController: UIViewController {
    
//    let collectionView = UICollectionView()
    let backButton = UIButton(type: .system)
    
    let calendarV = FSCalendar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setConstraints()
    }
    
    private func setUI() {
        [backButton, calendarV].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        calendarV.backgroundColor = .gray
        
        backButton.backgroundColor = .lightGray
        backButton.setTitle("취소", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.addTarget(self, action: #selector(didTappedBackButton(_:)), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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
