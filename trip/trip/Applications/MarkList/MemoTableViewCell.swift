//
//  MemoTableViewCell.swift
//  trip
//
//  Created by 전도균 on 2023/02/23.
//

import UIKit

class MemoTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: MemoTableViewCell.self)
    
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: MemoTableViewCell.identifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MemoTableViewCell {
    private func setUI() {
        self.addSubview(titleLabel)
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
    }
    
    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    func configure(text: String) {
        titleLabel.text = text
    }
}
