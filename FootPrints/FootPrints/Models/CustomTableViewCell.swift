//
//  CustomTableViewCell.swift
//  FootPrints
//
//  Created by 전도균 on 2022/10/05.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    let placeLabel = UILabel()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

extension CustomTableViewCell {
    private func setUI() {
        [placeLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        placeLabel.text = ""
    }
    private func setAutoLayout() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
