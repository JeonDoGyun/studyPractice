//
//  EditView.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/09/04.
//

import UIKit

class EditView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EditView {
    private func setUI() {
        backgroundColor = .red
    }
}
