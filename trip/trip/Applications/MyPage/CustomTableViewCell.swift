//
//  CustomTableViewCell.swift
//  trip
//
//  Created by 전도균 on 2023/02/11.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CustomTableViewCell.self)

    let titleLabel = UILabel()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUI()
        setConstraints()
    }

}

extension CustomTableViewCell {
    private func setUI() {
        self.addSubview(titleLabel)
        titleLabel.sizeToFit()
    }
    
    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
