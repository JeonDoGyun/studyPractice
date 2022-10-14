//
//  CustomTableViewCell.swift
//  PictureMyDiary
//
//  Created by 전도균 on 2022/10/10.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func didTapEditButton(tag: Int)
    func didTapDeleteButton(tag: Int)
}

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    let feeling = UIImageView() // 기분 이미지
    let picture = UIImageView() // 사진
    let titleLabel = UILabel() // 제목
    let descriptionLabel = UILabel() // 내용
    let dayLabel = UILabel() // 날짜
    let weatherLabel = UILabel() // 날씨
    let lateLabel = UILabel() // 수정한지 얼마나 되었는지?
    
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
        
//        feeling.backgroundColor = .red
//        titleLabel.backgroundColor = .green
//        descriptionLabel.backgroundColor = .blue
//        lateLabel.backgroundColor = .lightGray
        picture.backgroundColor = .lightGray
//        dayLabel.backgroundColor = .green
//        weatherLabel.backgroundColor = .yellow
        
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
        
//        dayLabel.text = "날짜(MM-dd)"
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
            
            picture.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            picture.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            picture.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            picture.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: picture.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: lateLabel.topAnchor),
            
            lateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            lateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            lateLabel.widthAnchor.constraint(equalToConstant: 110),
            lateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
        ])
    }
}
