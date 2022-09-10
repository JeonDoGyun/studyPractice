//
//  ProductTableViewCell.swift
//  Domino
//
//  Created by 전도균 on 2022/09/08.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "ProductTableViewCell"
    
    let image = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductTableViewCell {
    private func setUI() {
        [image, nameLabel, priceLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        [nameLabel, priceLabel].forEach {
            $0.text = ""
            $0.sizeToFit()
        }
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.widthAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 40),
//            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            priceLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
