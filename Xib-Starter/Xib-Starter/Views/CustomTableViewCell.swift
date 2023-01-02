//
//  CustomTableViewCell.swift
//  Xib-Starter
//
//  Created by 전도균 on 2022/12/19.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CustomTableViewCell.self) // "CustomTableViewCell" 과 같음

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
