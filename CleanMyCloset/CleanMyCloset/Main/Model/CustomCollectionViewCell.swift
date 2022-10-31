//
//  CustomCollectionViewCell.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/10/31.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomCollectionViewCell {
    private func setUI() {
        backgroundColor = .red
    }
}
