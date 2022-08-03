//
//  CustomTableViewCell.swift
//  RatingsApp-Code
//
//  Created by 전도균 on 2022/08/01.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let myTitle = UILabel()
    let mySubtitle = UILabel()
    let myImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(myTitle) // 그냥 addSubview()를 해도 뜨긴 뜸 (self.addSubview() 의미)
        contentView.addSubview(mySubtitle)
        contentView.addSubview(myImageView)
        
        
        myTitle.frame = CGRect(x: 12,
                               y: 2,
                               width: 0,
                               height: 0)
        
        mySubtitle.frame = CGRect(x: 12,
                                  y: 30,
                                  width: 0,
                                  height: 0)
        mySubtitle.font = UIFont.systemFont(ofSize: 13)
        
        myImageView.frame = CGRect(x: contentView.frame.maxX - 50,
                                   y: contentView.frame.midY - 12,
                                   width: 80,
                                   height: 24)
        myImageView.contentMode = .scaleAspectFit // 사진 안 깨지게
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
