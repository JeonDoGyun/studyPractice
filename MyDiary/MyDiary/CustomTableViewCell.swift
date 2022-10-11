//
//  CustomTableViewCell.swift
//  MyDiary
//
//  Created by 전도균 on 2022/10/07.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func didTapEditButton(tag: Int)
    func didTapDeleteButton(tag: Int)
}

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    let feeling = UIImageView()
    let picture = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let dayLabel = UILabel()
    let weatherLabel = UILabel()
    let lateLabel = UILabel()
    
    weak var delegate: CustomTableViewCellDelegate?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUI()
        setLayout()
    }

}

extension CustomTableViewCell {
    private func setUI() {
        self.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        
        feeling.backgroundColor = .red
        titleLabel.backgroundColor = .green
        descriptionLabel.backgroundColor = .blue
        lateLabel.backgroundColor = .white
        picture.backgroundColor = .red
        dayLabel.backgroundColor = .green
        weatherLabel.backgroundColor = .yellow
        
        feeling.frame = CGRect(origin: .zero, size: CGSize(width: 60, height: 60))
        feeling.layer.cornerRadius = feeling.frame.height/2
        feeling.layer.borderWidth = 1
        feeling.layer.borderColor = UIColor.clear.cgColor
        feeling.clipsToBounds = true // border에 이미지를 맞춰 넣을 것인가?
        feeling.layer.masksToBounds = true // 안에 넣은 사진이 원 모양을 따라가게 됨
        
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .left
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 13)
        
        lateLabel.textColor = .lightGray
        lateLabel.font = .systemFont(ofSize: 12)
        lateLabel.textAlignment = .right
        lateLabel.text = "얼마나 지났는가?"
        
        dayLabel.text = "날짜(MM-dd)"
        dayLabel.font = .systemFont(ofSize: 12)
        
        weatherLabel.text = "날씨정보"
        weatherLabel.font = .systemFont(ofSize: 12)
        
        [feeling, titleLabel, descriptionLabel, lateLabel, picture, dayLabel, weatherLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            feeling.topAnchor.constraint(equalTo: contentView.topAnchor),
            feeling.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            feeling.widthAnchor.constraint(equalToConstant: 60),
            feeling.heightAnchor.constraint(equalToConstant: 60),
            
            dayLabel.topAnchor.constraint(equalTo: feeling.bottomAnchor, constant: 5),
            dayLabel.leadingAnchor.constraint(equalTo: feeling.leadingAnchor),
            dayLabel.widthAnchor.constraint(equalToConstant: 60),
            dayLabel.heightAnchor.constraint(equalToConstant: 30),
            
            weatherLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 5),
            weatherLabel.leadingAnchor.constraint(equalTo: feeling.leadingAnchor),
            weatherLabel.widthAnchor.constraint(equalToConstant: 60),
            weatherLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: feeling.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: feeling.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: lateLabel.topAnchor),
            
            lateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            lateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            lateLabel.widthAnchor.constraint(equalToConstant: 110),
            lateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
        ])
    }
}

//extension CustomTableViewCell {
//    @objc
//    private func didTapEditButton(_ sender: UIButton) {
//        print(#function)
//        delegate?.didTapEditButton(tag: tag)
//    }
//
//    @objc
//    private func didTapDeleteButton(_ sender: UIButton) {
//        print(#function)
//        delegate?.didTapDeleteButton(tag: tag)
//    }
//}
