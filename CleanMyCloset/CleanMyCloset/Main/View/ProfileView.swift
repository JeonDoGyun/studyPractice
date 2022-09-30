//
//  ProfileView.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/09/30.
//

import UIKit

class ProfileView: UIView {
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
