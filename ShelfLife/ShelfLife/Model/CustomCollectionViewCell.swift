//
//  CustomCollectionViewCell.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/08/27.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    let productImageView = UIImageView()
    let titleLabel = UILabel()
    let expiryDateLabel = UILabel() // 등록한 유통기한
    let dateLabel = UILabel() // 남은 날짜
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension CustomCollectionViewCell {
    func setUI() {
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(expiryDateLabel)
        contentView.addSubview(dateLabel)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        expiryDateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        productImageView.backgroundColor = .yellow
        productImageView.layer.borderWidth = 1
        productImageView.layer.borderColor = UIColor.lightGray.cgColor
        
        titleLabel.layer.borderWidth = 1
        titleLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        expiryDateLabel.layer.borderWidth = 1
        expiryDateLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        dateLabel.layer.borderWidth = 1
        dateLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -60),
            
            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            expiryDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            expiryDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            expiryDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            dateLabel.topAnchor.constraint(equalTo: expiryDateLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
