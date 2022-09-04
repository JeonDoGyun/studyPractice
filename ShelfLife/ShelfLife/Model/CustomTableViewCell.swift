//
//  CustomTableViewCell.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/09/04.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTableViewCell {
    private func setUI() {
        contentView.addSubview(label)
        label.text = "first"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
