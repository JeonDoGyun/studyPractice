//
//  CustomTableViewCell.swift
//  DiffableDataSource-EX
//
//  Created by 전도균 on 2023/01/02.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CustomTableViewCell.self)

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(text: String) {
        titleLabel.text = text
    }
}
