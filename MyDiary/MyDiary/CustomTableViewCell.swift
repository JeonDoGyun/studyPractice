//
//  CustomTableViewCell.swift
//  MyDiary
//
//  Created by 전도균 on 2022/10/07.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    let picture = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let editButton = UIButton(type: .system)
    let deleteButton = UIButton(type: .system)
    
    
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
        
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 13)
        
        editButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        editButton.addTarget(self, action: #selector(didTapEditButton(_:)), for: .touchUpInside)
        
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton(_:)), for: .touchUpInside)
        
        [picture, titleLabel, descriptionLabel, editButton, deleteButton].forEach {
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
            titleLabel.trailingAnchor.constraint(equalTo: editButton.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: picture.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -70),
            
            editButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            editButton.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -5),
            editButton.widthAnchor.constraint(equalToConstant: 20),
            editButton.heightAnchor.constraint(equalToConstant: 20),
            
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

extension CustomTableViewCell {
    @objc
    private func didTapEditButton(_ sender: UIButton) {
        let mainVC = ViewController()
        mainVC.navigationController?.pushViewController(EditViewController(), animated: true)
        print(#function)
    }
    
    @objc
    private func didTapDeleteButton(_ sender: UIButton) {
        print(#function)
    }
}
