//
//  RegisterTableViewCell.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/11/01.
//

import UIKit

class RegisterTableViewCell: UITableViewCell {
    
    static let identifier = "RegisterTableViewCell"

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUI()
        setAttributes()
    }
}

extension RegisterTableViewCell {
    private func setUI() {
        
    }
    
    private func setAttributes() {
        NSLayoutConstraint.activate([
        
        ])
    }
}
