//
//  AddTableViewCell.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/10/31.
//

import UIKit

class AddTableViewCell: UITableViewCell {
    
    static let identifier = "AddTableViewCell"
    
    let titleLabel = UILabel()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUI()
        setAttributes()
    }
}

extension AddTableViewCell {
    private func setUI() {
        self.backgroundColor = .systemBlue
        self.selectionStyle = .none
        self.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
    }
    
    private func setAttributes() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
