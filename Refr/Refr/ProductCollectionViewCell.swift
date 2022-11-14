//
//  ProductCollectionViewCell.swift
//  Refr
//
//  Created by 전도균 on 2022/11/14.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
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
        backgroundColor = .lightGray
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 20
//        layer.masksToBounds = true
    }
    
    private func setLayout() {
        
    }
}
