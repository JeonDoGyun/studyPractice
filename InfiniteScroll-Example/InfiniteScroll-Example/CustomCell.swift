//
//  CustomCell.swift
//  InfiniteScroll-Example
//
//  Created by 전도균 on 2022/09/14.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    static let identifier = "CustomCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

