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
    
    let picture = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let timeLabel = UILabel()
//    let editButton = UIButton(type: .system)
//    let deleteButton = UIButton(type: .system)
    
    weak var delegate: CustomTableViewCellDelegate?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUI()
        setLayout()
    }

}

extension CustomTableViewCell {
    private func setUI() {
        self.backgroundColor = .white
        
        picture.backgroundColor = .red
        titleLabel.backgroundColor = .green
        descriptionLabel.backgroundColor = .blue
        timeLabel.backgroundColor = .white
        
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 13)
        
        timeLabel.textColor = .lightGray
        timeLabel.font = .systemFont(ofSize: 12)
        timeLabel.textAlignment = .right
        
//        editButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
//        editButton.addTarget(self, action: #selector(didTapEditButton(_:)), for: .touchUpInside)
//
//        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
//        deleteButton.addTarget(self, action: #selector(didTapDeleteButton(_:)), for: .touchUpInside)
        
        [picture, titleLabel, descriptionLabel, timeLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: contentView.topAnchor),
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            picture.widthAnchor.constraint(equalToConstant: 160),
            picture.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: picture.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: picture.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(greaterThanOrEqualTo: timeLabel.topAnchor),
            
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 110),
            timeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
//            editButton.topAnchor.constraint(equalTo: contentView.topAnchor),
//            editButton.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -5),
//            editButton.widthAnchor.constraint(equalToConstant: 20),
//            editButton.heightAnchor.constraint(equalToConstant: 20),
//
//            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor),
//            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//            deleteButton.widthAnchor.constraint(equalToConstant: 20),
//            deleteButton.heightAnchor.constraint(equalToConstant: 20),
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
