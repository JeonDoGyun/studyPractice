//
//  PlaceViewController.swift
//  FootPrints
//
//  Created by 전도균 on 2022/10/05.
//

import UIKit

class PlaceViewController: BasicViewController {
    
    let cancelButton = UIButton(type: .system)
    let addButton = UIButton(type: .system)
    
    let place = ""
    let placeImageView = UIImageView()
    let placeLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAutoLayout()
    }
}

extension PlaceViewController {
    private func setUI() {
        [cancelButton, addButton, placeLabel, placeImageView].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        cancelButton.setTitle("cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)
        
        addButton.setTitle("add", for: .normal)
        addButton.addTarget(self, action: #selector(didTapAddButton(_:)), for: .touchUpInside)
        
        placeImageView.backgroundColor = .red
        
        placeLabel.text = "여기에 장소 이름"
    }
    
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: 100),
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 100),
            
            placeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50), 
            placeImageView.widthAnchor.constraint(equalToConstant: 250),
            placeImageView.heightAnchor.constraint(equalToConstant: 250),
            
            placeLabel.topAnchor.constraint(equalTo: placeImageView.bottomAnchor, constant: 20),
            placeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension PlaceViewController {
    @objc
    private func didTapCancelButton(_ sender: UIButton) {
        print(#function)
    }
    
    @objc
    private func didTapAddButton(_ sender: UIButton) {
        print(#function)
    }
}
