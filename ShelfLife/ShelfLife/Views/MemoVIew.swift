//
//  MemoVIew.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/09/04.
//

import UIKit

class MemoVIew: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MemoVIew {
    private func setUI() {
        backgroundColor = .yellow
    }
}
