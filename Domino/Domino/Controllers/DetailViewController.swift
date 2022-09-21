//
//  DetailViewController.swift
//  Domino
//
//  Created by 전도균 on 2022/09/06.
//

import UIKit

class DetailViewController: BasicViewController {
    
    let menuImage = UIImageView()
    let countLabel = UILabel()
    let addButton = UIButton(type: .system)
    let subButton = UIButton(type: .system)
    
    var productName = ""
    var count: Int = 0 {
        willSet {
            countLabel.text = "\(newValue) 개"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    deinit{
        WishListViewController.products.append(self.navigationItem.title ?? "")
        WishListViewController.counts.append(count)
    }
}


extension DetailViewController {
    @objc
    private func didTapAddButton(_ sender: UIButton) {
        count += 1
    }
    
    @objc
    private func didTapSubButton(_ sender: UIButton) {
        count -= 1
    }
}

extension DetailViewController {
    private func setUI() {
        [menuImage, countLabel, addButton, subButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        subButton.setTitle("-", for: .normal)
        subButton.backgroundColor = .white
        subButton.addTarget(self, action: #selector(didTapSubButton(_:)), for: .touchUpInside)
        subButton.layer.borderColor = UIColor.darkGray.cgColor
        subButton.layer.borderWidth = 2
        
        countLabel.text = "\(count) 개"
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 18)
        countLabel.backgroundColor = .darkGray
        countLabel.textColor = .white
        countLabel.layer.borderColor = UIColor.darkGray.cgColor
        countLabel.layer.borderWidth = 2
        
        addButton.setTitle("+", for: .normal)
        addButton.backgroundColor = .white
        addButton.addTarget(self, action: #selector(didTapAddButton(_:)), for: .touchUpInside)
        addButton.layer.borderColor = UIColor.darkGray.cgColor
        addButton.layer.borderWidth = 2
        
        NSLayoutConstraint.activate([
            menuImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            menuImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuImage.heightAnchor.constraint(equalToConstant: 450),
            
            subButton.topAnchor.constraint(equalTo: countLabel.topAnchor),
            subButton.trailingAnchor.constraint(equalTo: countLabel.leadingAnchor),
            subButton.bottomAnchor.constraint(equalTo: countLabel.bottomAnchor),
            
            countLabel.topAnchor.constraint(equalTo: menuImage.bottomAnchor, constant: 40),
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.widthAnchor.constraint(equalToConstant: 180),
            countLabel.heightAnchor.constraint(equalToConstant: 50),
            
            addButton.topAnchor.constraint(equalTo: countLabel.topAnchor),
            addButton.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: countLabel.bottomAnchor),

        ])
    }
}
