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
    var titleLabel = UILabel()
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
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
