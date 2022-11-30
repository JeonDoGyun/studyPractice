//
//  ProductCollectionViewCell.swift
//  Refr
//
//  Created by 전도균 on 2022/11/14.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    let productImageView = UIImageView()
    let nameLabel = UILabel() // 제품명
    let expiryLabel = UILabel() // 남은 유통기한
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductCollectionViewCell {
    private func setUI() {
        [productImageView, nameLabel, expiryLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.backgroundColor = .lightGray
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 20
        layer.masksToBounds = true
        
        nameLabel.sizeToFit()
        nameLabel.textAlignment = .center
//        nameLabel.backgroundColor = .green
        
        expiryLabel.sizeToFit()
        expiryLabel.textAlignment = .center
//        expiryLabel.backgroundColor = .blue
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            productImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            productImageView.widthAnchor.constraint(equalToConstant: 150),
            productImageView.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            
            expiryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            expiryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            expiryLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
